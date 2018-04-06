//This was necessary in order to make the co-simulation work, due to a bug in vivado
//If you don't need it, than you can remove the following 2 includes
//#include "/media/dati/simo/Xilinx/Vivado/2017.3/include/gmp.h"
//#include "/media/dati/simo/Xilinx/Vivado/2017.3/include/mpfr.h"

/*
	This was necessary in order to make the co-simulation work, due to a bug in vivado
	If you don't need it, than you can remove the previous 2 includes.

	PLEASE NOTE THAT THE C-SIMULATION WON'T WORK DUE TO ANOTHER BUG IN VIVADO,
	YOU CAN SOLVE IT BY USING A C TESTBENCH INSTEAD OF A CPP ONE.
	A WORKAROUND I'VE FOUND IS TO RUN A CO-SIMULATION AND THEN STOP IT AFTER
	IT HAS RUN THE TESTBENCH.

 */

#include "net_config.hpp"
#include "net_types.hpp"
#include "zhang_convolution.hpp"
#include <stdio.h>


#define min(a, b) (((a) < (b)) ? (a) : (b))

/*
	These values were chosen in order to have more or less the
	same latency between modules which run at the same time
	due to the dataflow pragma, so there won't be bottlenecks,
	while respecting the constraints on the bram size and the
	number of avaiable DSPs (which is influenced only by Tm and Tn values).

*/
#define Tr 35
#define Tc 25
#define Tm 28
#define Tn 3

/*
	Tr and Tc refer to the size of the output tiles, so we need to know
	how large the input tiles will be.
	MAX_STR_* and MAX_KER_* values depend on the network you're trying
	to use, you can manually define them in this file or you can
	generate a proper net_config.hpp using the provided configurator.
*/

#define inH (Tr-1)*MAX_STR_H+MAX_KER_H
#define inW (Tc-1)*MAX_STR_W+MAX_KER_W

/*
	This is needed in order to use parameters in HLS pragmas, so it's
	extremly useful, since every pragma TRIPCOUNT, necessary to get an
	estimate of the modules' latency at the end of the synthesis, depends
	from the tiling parameters.
*/
#define PRAGMA_SUB(x) _Pragma (#x)
#define DO_PRAGMA(x) PRAGMA_SUB(x)

#define READ_IN_TRIP Tn*inW*inH
#define READ_WH_TRIP Tm*Tn*MAX_KER_H*MAX_KER_W
#define MAX_OUT_TRIP Tm*Tr*Tc
#define READ_IN_TRIP_X_2 2*Tn*inW*inH


/*
	These resets don't effect the performance that much. They're extremly
	efficient, since they exploit the partitioning performed on the arrays.
*/
void set_bias_buffer_to_0(tensor_data_t_hw_o biasbuf[MAX_OUT_CH]){
#pragma INLINE
	for_bias:for(int ii=0; ii < MAX_OUT_CH; ii++){
	#pragma HLS PIPELINE
		biasbuf[ii] = 0;
	}
}

void set_out_buffer_to_0(
		tensor_data_t_hw_o outputfm[Tm][Tr][Tc]){
#pragma INLINE

	for(int r = 0; r < Tr; r++){
		for(int c = 0; c < Tc; c++){
		#pragma HLS PIPELINE II=1
			for(int i = 0; i < Tm; i++){
			#pragma HLS UNROLL
				outputfm[i][r][c] = 0;
			}
		}
	}
}

void set_in_wh_buffers_to_0(
		layer_config curr_layer,
		tensor_data_t_hw_w weightsbuf[Tm][Tn][MAX_KER_H][MAX_KER_W],
		tensor_data_t_hw inputfm[Tn][inH][inW]){
#pragma HLS INLINE

	for(int kh = 0; kh < MAX_KER_H; kh++){
		for(int kw = 0; kw < MAX_KER_W; kw++){
		#pragma HLS PIPELINE II=1
			for(int i = 0; i < Tm; i++){
			#pragma HLS UNROLL
				for(int j = 0; j < Tn; j++){
				#pragma HLS UNROLL
					weightsbuf[i][j][kh][kw] = 0;
				}
			}
		}
	}
	for(int r = 0; r < inH; r++){
		for(int c = 0; c < inW; c++){
		#pragma HLS PIPELINE II=1
			for(int j = 0; j < Tn; j++){
			#pragma HLS UNROLL
					inputfm[j][r][c] = 0;
			}
		}
	}

}

void read_input(tensor_data_t *input, layer_config curr_layer, int ti, int row, int col, tensor_data_t_hw inputfm[Tn][inH][inW]){

	//We need to start from the correct input channel and than we need to move
	//row*S rows and col*S cols, since this may not be the 1st tile we're loading
	int stride = ti * curr_layer.in_w * curr_layer.in_h + (row*curr_layer.str_h) * curr_layer.in_w + (col*curr_layer.str_w);

	//We need to read (row+Tr-1)*S+K - row*S = (Tr-1)*S+K rows.
	//If they're more than the total number of rows in the input, n_rows becames the number of rows in the input
	int n_rows = min((Tr-1)*curr_layer.str_h + curr_layer.ker_h, curr_layer.in_h);
	int n_cols = min((Tc-1)*curr_layer.str_w + curr_layer.ker_w, curr_layer.in_w);
	int n_depth = min(Tn, curr_layer.in_ch);

	//If, starting from position 'row' and trying to read 'n_rows' rows we exceed the image size,
	//we need to decrease n_rows to the maximum value allowed
	n_rows = row + n_rows > curr_layer.in_h ? curr_layer.in_h - row : n_rows;
	n_cols = col + n_cols > curr_layer.in_w ? curr_layer.in_w - col : n_cols;
	n_depth = ti + n_depth > curr_layer.in_ch ? curr_layer.in_ch - ti : n_depth;

	unsigned short index_i = 0, index_jj = 0;

	readIn: for(int itr = 0, i = 0, j = 0, jj = 0;
			itr < n_depth * n_rows * n_cols;
			itr++,j++) {
	#pragma HLS PIPELINE
	DO_PRAGMA(HLS LOOP_TRIPCOUNT max=READ_IN_TRIP)

		if(j == n_cols) {
			//at the end of a row, we pass on to the next one
			j = 0; i++; index_i = i * curr_layer.in_w;
			if(i == n_rows) {
				//at the end of a n_rows*n_cols 2d patch, we pass on to the next input channel/depth
				j = 0; i = 0; jj++; index_i = 0; index_jj = jj * curr_layer.in_w * curr_layer.in_h;
			}
		}

		inputfm[jj][i][j] = (input[stride   +
								   index_jj +
								   index_i  + j]);

	}
}

void read_weights(tensor_data_t *weights, layer_config curr_layer, int to, int ti, tensor_data_t_hw_w weightsbuf[Tm][Tn][MAX_KER_H][MAX_KER_W]){

	//We need to start loading the weights by taking into account the current ouput and input depth
	int kernel_stack_size = curr_layer.in_ch * curr_layer.ker_w * curr_layer.ker_h;
	int kernel_size = curr_layer.ker_w * curr_layer.ker_h;
	int stride = to * kernel_stack_size + ti * kernel_size;

	//We can't read more channels than available
	int n_depth_o = min(Tm, curr_layer.out_ch);
	int n_depth_i = min(Tn, curr_layer.in_ch);

	//If, starting from the current depth and trying to read 'x' channels we exceed the total number
	//of channels, we need to decrease 'x' to the maximum value allowed
	n_depth_o = to + n_depth_o > curr_layer.out_ch ? curr_layer.out_ch - to : n_depth_o;
	n_depth_i = ti + n_depth_i > curr_layer.in_ch ? curr_layer.in_ch - ti : n_depth_i;

	//this is necessary to avoid critical paths while calculating weights' index
	unsigned short index_i = 0, index_jj = 0, index_ii = 0;

	readWt: for(int itr = 0,  i = 0, j = 0, ii = 0, jj = 0; itr < n_depth_o * n_depth_i * curr_layer.ker_w * curr_layer.ker_h; itr++,j++) {
	#pragma HLS PIPELINE
	DO_PRAGMA(HLS LOOP_TRIPCOUNT max=READ_WH_TRIP)

		if(j == curr_layer.ker_w) {
			//at the end of a kernel row, we pass on to the next one
			j = 0; i++; index_i = i * curr_layer.ker_w;

			if(i == curr_layer.ker_h) {
				//at the end of a kernel, we pass on to the next input depth
				j = 0; i = 0; jj++; index_i = 0; index_jj = jj * kernel_size;

				if(jj == n_depth_i) {
					//at the end of a kernel "pile/stack", we pass on to the next output depth
					j = 0; i = 0; jj = 0; ii++;index_i = 0; index_jj = 0; index_ii = ii * kernel_stack_size;
				}
			}
		}

		weightsbuf[ii][jj][i][j] = weights[stride   +
										   index_ii +
										   index_jj +
										   index_i  + j];
					//  printf("Aindex_i = %5d Aindex_jj = %5d Aindex_ii = %5d\n", index_i, index_jj, index_ii);
					//  printf("Bindex_i = %5d Bindex_jj = %5d Bindex_ii = %5d\n\n", i * curr_layer.ker_w, jj * kernel_size, ii * kernel_stack_size);
	}

}

void read_bias(volatile tensor_data_t *bias, layer_config curr_layer, tensor_data_t_hw_o biasbuf[MAX_OUT_CH]){
#pragma HLS INLINE

	if(curr_layer.has_bias == 1){

		for_bias:for(int ii=0; ii < curr_layer.out_ch; ii++){
		DO_PRAGMA(HLS LOOP_TRIPCOUNT max=Tm)
		#pragma HLS PIPELINE
			biasbuf[ii] = (bias[ii]);
		}

	}

}


void convolve(layer_config curr_layer, tensor_data_t_hw_o outputfm[Tm][Tr][Tc],
				tensor_data_t_hw_o partial_outputfm[Tm][Tr][Tc],
			    tensor_data_t_hw_w weightsbuf[Tm][Tn][MAX_KER_H][MAX_KER_W],
				tensor_data_t_hw inputfm[Tn][inH][inW],
				int row, int col, int to, int ti)
{

	ker_h:for(int i =0; i < curr_layer.ker_h; i ++) {
	DO_PRAGMA(HLS LOOP_TRIPCOUNT max=MAX_KER_H)
		ker_w:for(int j =0; j < curr_layer.ker_w; j ++) {
		DO_PRAGMA(HLS LOOP_TRIPCOUNT max=MAX_KER_W)
			tr_loop:for (int trr=0 ; row + trr < min(row+Tr,curr_layer.out_h); trr++){
			DO_PRAGMA( HLS LOOP_TRIPCOUNT max=Tr)
				int r_index = curr_layer.str_h*trr;
				tc_loop:for (int tcc=0 ; col + tcc < min(col+Tc,curr_layer.out_w); tcc++){
				#pragma HLS PIPELINE
				DO_PRAGMA(HLS LOOP_TRIPCOUNT max=Tc)

					int c_index = curr_layer.str_w*tcc;
					too_loop:for(int too=0; too < Tm; too++){
					#pragma HLS UNROLL
					//This is needed to achieve II=1
					#pragma HLS dependence variable=partial_outputfm inter false

						tensor_data_t_hw_o out_value_tot = 0;

						tii_loop_mul:for(int tii=0; tii < Tn; tii ++){
						#pragma HLS UNROLL

							tensor_data_t_hw in_value = inputfm[tii][r_index+i][c_index+j];
							tensor_data_t_hw_w w_value = weightsbuf[too][tii][i][j];
							tensor_data_t_hw_o out_value = in_value * w_value;

							out_value_tot +=  out_value;

						}

						partial_outputfm[too][trr][tcc] += out_value_tot;
						outputfm[too][trr][tcc] = partial_outputfm[too][trr][tcc];
					/*
					 	this may look strange, but it's the only way to get it to work while
						using the pragma HLS DATAFLOW, since you can read/write each array
						only in a single function, so accumulating (which requires both a read and a write)
						on outputfm and then reading it in the function write_output won't work
					*/

					}
				}
			}
		}
	}
}


void write_output(layer_config curr_layer, volatile tensor_data_t *out, int to, int row, int col, tensor_data_t_hw_o outputfm[Tm][Tr][Tc], tensor_data_t_hw_o biasbuf[Tm]){

	int out_size = curr_layer.out_w * curr_layer.out_h;

	//We need to start writing back the output from the right depth and row and col
	int stride = to * out_size + row * curr_layer.out_w + col;

	//We can't write more stuff than what I've got in the tile, this can happen if the output is smaller than the tile
	int n_rows = min(Tr, curr_layer.out_h);
	int n_cols = min(Tc, curr_layer.out_w);
	int n_depth_o = min(Tm, curr_layer.out_ch);

	//We cannot exceed the output size
	n_rows = row + n_rows > curr_layer.out_h ? curr_layer.out_h - row : n_rows;
	n_cols = col + n_cols > curr_layer.out_w ? curr_layer.out_w - col : n_cols;
	n_depth_o = to + n_depth_o > curr_layer.out_ch ? curr_layer.out_ch - to : n_depth_o;

	unsigned short i_index = 0, ii_index = 0;

    writeOut: for(int itr = 0, i = 0, j = 0, ii = 0; itr < n_rows * n_cols * n_depth_o; itr++,j++) {
    #pragma HLS PIPELINE
    DO_PRAGMA(HLS LOOP_TRIPCOUNT max=MAX_OUT_TRIP)

        if(j == n_cols) {
        	//at the end of a row, we pass on to the next one
        	j = 0; i++; i_index = i * curr_layer.out_w;

        	if(i == n_rows) {
        		//at the end of a channel, we pass on to the next one
        		j = 0; i = 0; ii++; i_index = 0; ii_index = ii * out_size;
        	}
        }

        out[stride + ii_index + i_index + j] = (outputfm[ii][i][j] + biasbuf[to+ii]);
    }
}

/*
	The following functions are pretty self-expalanatory. Those weird nested calls were necessary due to
	the DATAFLOW pragma
 */

void read_in_wh( tensor_data_t *weights,  tensor_data_t *image, layer_config curr_layer, int to, int ti, int row, int col,tensor_data_t_hw inputfm[Tn][inH][inW], tensor_data_t_hw_w weightsbuf[Tm][Tn][MAX_KER_H][MAX_KER_W]){

	set_in_wh_buffers_to_0(curr_layer, weightsbuf, inputfm);
	read_input(image, curr_layer, ti, row, col, inputfm);
	read_weights(weights, curr_layer, to, ti, weightsbuf);
}

void dataflow_in_channels(tensor_data_t *weights, tensor_data_t *image, layer_config curr_layer,
		int to, int ti, int row, int col,
		tensor_data_t_hw_o partial_outputfm[Tm][Tr][Tc], tensor_data_t_hw_o outputfm[Tm][Tr][Tc],
		tensor_data_t_hw inputfm[Tn][inH][inW], tensor_data_t_hw_w weightsbuf[Tm][Tn][MAX_KER_H][MAX_KER_W]){
#pragma HLS DATAFLOW

	read_in_wh(weights, image, curr_layer, to,ti,row,col,inputfm,weightsbuf);
	convolve(curr_layer, outputfm, partial_outputfm, weightsbuf, inputfm, row, col, to, ti);

}

void dataflow_out_channels(tensor_data_t *weights,  tensor_data_t *image, layer_config curr_layer,
		volatile tensor_data_t *out, int to, int row, int col,
		tensor_data_t_hw_o outputfm[Tm][Tr][Tc], tensor_data_t_hw_o partial_outputfm[Tm][Tr][Tc],
		tensor_data_t_hw inputfm[Tn][inH][inW], tensor_data_t_hw_w weightsbuf[Tm][Tn][MAX_KER_H][MAX_KER_W],
		tensor_data_t_hw_o biasbuf[Tm]){

#pragma HLS DATAFLOW

	ti_loop:for(int ti = 0; ti < curr_layer.in_ch; ti += Tn){
DO_PRAGMA(HLS LOOP_TRIPCOUNT min=1 max=Tn)

		dataflow_in_channels(weights, image, curr_layer, to, ti, row, col, partial_outputfm, outputfm, inputfm, weightsbuf);

	}

	write_output(curr_layer, out,to, row, col, outputfm, biasbuf);
}


void zhang_cnn(
		 tensor_data_t *image,
		 tensor_data_t *weights,
		 volatile tensor_data_t *out,
		 volatile tensor_data_t *bias,
		 layer_config curr_layer_in		){

//The depth attribute is only needed to run the co-simulation, you need to make sure its value is big enough
#pragma HLS INTERFACE m_axi port=image offset=slave bundle=gmem depth=102400
#pragma HLS INTERFACE m_axi port=weights offset=slave bundle=gmem depth=102400
#pragma HLS INTERFACE m_axi port=out offset=slave bundle=gmem depth=102400
#pragma HLS INTERFACE m_axi port=bias offset=slave bundle=gmem depth=1024

#pragma HLS INTERFACE s_axilite port=image bundle=control
#pragma HLS INTERFACE s_axilite port=weights bundle=control
#pragma HLS INTERFACE s_axilite port=out bundle=control
#pragma HLS INTERFACE s_axilite port=bias bundle=control
#pragma HLS INTERFACE s_axilite port=curr_layer_in bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

static tensor_data_t_hw_o outputfm[Tm][Tr][Tc] = {0};
static tensor_data_t_hw_o biasbuf[MAX_OUT_CH] = {0};
static tensor_data_t_hw_w weightsbuf[Tm][Tn][MAX_KER_H][MAX_KER_W] = {0};
static tensor_data_t_hw   inputfm[Tn][inH][inW] = {0};
static tensor_data_t_hw_o partial_outputfm[Tm][Tr][Tc] = {0};

//We manually partition the arrays due to Vivado sometimes not recognizing the possibility to do so by its own
#pragma HLS ARRAY_PARTITION variable=partial_outputfm dim=1
#pragma HLS ARRAY_PARTITION variable=outputfm dim=1
#pragma HLS ARRAY_PARTITION variable=weightsbuf dim=1
#pragma HLS ARRAY_PARTITION variable=weightsbuf dim=2
#pragma HLS ARRAY_PARTITION variable=inputfm dim=1

#pragma HLS RESOURCE variable=partial_outputfm core=RAM_2P_BRAM

layer_config curr_layer = curr_layer_in;

set_bias_buffer_to_0(biasbuf);
read_bias(bias, curr_layer, biasbuf);

row_loop:for(int row = 0; row < curr_layer.out_h; row += Tr){
#pragma HLS LOOP_TRIPCOUNT min=24 max=30

	col_loop:for(int col = 0; col < curr_layer.out_w; col += Tc){
#pragma HLS LOOP_TRIPCOUNT min=24 max=30
		to_loop:for(int to = 0; to < curr_layer.out_ch; to += Tm){
#pragma HLS LOOP_TRIPCOUNT min=64 max=100

			dataflow_out_channels(weights, image, curr_layer, out,to,row,col, outputfm, partial_outputfm, inputfm, weightsbuf, biasbuf);
			set_out_buffer_to_0(partial_outputfm);
		}

	}

}


}
