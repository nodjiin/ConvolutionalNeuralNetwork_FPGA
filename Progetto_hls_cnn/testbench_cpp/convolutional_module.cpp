/*
* Alessandro Maragno - 09/11/2016
* convolutional_module.c
*/

#include <stdio.h>
#include <stdlib.h>

#include "convolutional_module.hpp"
#include "convolution.hpp"
#include "zhang_convolution_ping_pong.hpp"

module init_convolutional_mod(	int n_fil, 
								int ker_h, 
								int ker_w, 
								int pad_h, 
								int pad_w, 
								int stride_h, 
								int stride_w,
								int input_depth,
								tensor_data_t *weights,
								tensor_data_t *bias	)
{
	module new_conv_mod = {};
	
	new_conv_mod.stride_h = stride_h < 1 ? 1 : stride_h; // default is 1
	new_conv_mod.stride_w = stride_w < 1 ? 1 : stride_w; // default is 1
	
	new_conv_mod.pad_h = pad_h < 0 ? 0 : pad_h; // default is 0
	new_conv_mod.pad_w = pad_w < 0 ? 0 : pad_w; // default is 0
	
	new_conv_mod.ker_h = ker_h;
	new_conv_mod.ker_w = ker_w;
	
	new_conv_mod.filters = (tensor *)calloc(n_fil, sizeof(tensor));
	
	// TEST
	
	int fil;
	if(weights)
	{
		tensor_data_t *weights_ptr = weights;
		int i;
		
		for(fil = 0; fil < n_fil; fil++)
		{
			new_conv_mod.filters[fil] = init_tensor(input_depth, ker_w, ker_h, 0);
			// TEST
			
			for(i = 0; i < input_depth*ker_w*ker_h; i++)
			{
				new_conv_mod.filters[fil].data[i] = *weights_ptr;
				weights_ptr++;
			}
		}
		
		free(weights);
	}
	else for(fil = 0; fil < n_fil; fil++) new_conv_mod.filters[fil] = init_tensor(input_depth, ker_w, ker_h, 1);
	
	if(bias)
	{
		new_conv_mod.bias.d = n_fil;
		new_conv_mod.bias.w = 1;
		new_conv_mod.bias.h = 1;
		
		// TEST
		
		new_conv_mod.bias.data = bias; 
	} 
	else new_conv_mod.bias = init_tensor(n_fil, 1, 1, 1);
	
	new_conv_mod.n_filters = n_fil;
	
	new_conv_mod.act_type = IDENTITY;

	return new_conv_mod;
}

void  forward_convolutional_mod(module *cm)
{
	tensor out_vol;
	
	out_vol.w = (cm->input[0].w - cm->filters[0].w + 2*cm->pad_w)/cm->stride_w + 1;
	out_vol.h = (cm->input[0].h - cm->filters[0].h + 2*cm->pad_h)/cm->stride_h + 1;
	out_vol.d = cm->n_filters;

	int out_len = out_vol.d*out_vol.w*out_vol.h;

	out_vol.data =(tensor_data_t *) calloc(out_vol.w*out_vol.h*out_vol.d, sizeof(tensor_data_t));
	
	// TEST

    layer_config curr_layer;
      
      curr_layer.in_ch = (short) cm->input[0].d;
	  curr_layer.in_h = (short) cm->input[0].h;
	  curr_layer.in_w = (short) cm->input[0].w;
	  curr_layer.ker_w = (short) cm->filters[0].w;
	  curr_layer.ker_h = (short) cm->filters[0].h;
      curr_layer.ker_ch = (short) cm->input[0].d;
	  //layer.n_layer = 1;
	  curr_layer.pad_w = (short) cm->pad_w;
	  curr_layer.pad_h = (short) cm->pad_h;
	  curr_layer.relu = 0;
	  curr_layer.str_w = (short) cm->stride_w;
	  curr_layer.str_h = (short) cm->stride_h;
	  curr_layer.out_ch = (short) cm->n_filters;
	  curr_layer.out_h = (short) (cm->input[0].h - cm->filters[0].h + 2*cm->pad_h)/cm->stride_h + 1;
	  curr_layer.out_w = (short) (cm->input[0].w - cm->filters[0].w + 2*cm->pad_w)/cm->stride_w + 1;
	  curr_layer.has_bias = 0;            
	  curr_layer.act_type = cm->act_type;
	
      if(cm->bias.data)
	    curr_layer.has_bias = 1;
//COMMENTATO PER TEST

       //MI SERVE UN UNICO VETTORONE CON TUTTI I PESI, NON UN VETTORE DI TENSORI
        
        tensor_data_t *weights_ptr =(tensor_data_t *) calloc(curr_layer.ker_w*curr_layer.ker_h*curr_layer.in_ch*cm->n_filters, sizeof(tensor_data_t));
		int fil,i, pos = 0;
		
		for(fil = 0; fil < cm->n_filters; fil++)
		{
			for(i = 0; i < curr_layer.in_ch*curr_layer.ker_w*curr_layer.ker_h; i++)
			{
				weights_ptr[pos] =  cm->filters[fil].data[i];
				pos++;
			}
		}
		


    printf("LAYER CONFIG:\n");
    printf("in_w: %d in_h: %d in_ch: %d \n", curr_layer.in_w, curr_layer.in_h, curr_layer.in_ch);
    printf("out_w: %d out_h: %d out_ch: %d \n", curr_layer.out_w, curr_layer.out_h, curr_layer.out_ch);
    printf("ker_w: %d ker_h: %d ker_ch: %d \n", curr_layer.ker_w, curr_layer.ker_h, curr_layer.ker_ch);
    printf("str_w: %d str_h: %d pad_h: %d pad_w: %d\n", curr_layer.str_w, curr_layer.str_h, curr_layer.pad_h, curr_layer.pad_h);
    printf("Activation Type: %d\n", curr_layer.act_type);
    // printf("Un kernel è grande %d : \n",sizeof(cm->filters[0]));

    //set_fpga(curr_layer, cm->input[0].data, out_vol.data,weights_ptr, cm->bias.data);

	//convolve_tensors(out_vol.data,cm->input[0].data, weights_ptr, cm->bias.data, curr_layer);
	
    zhang_cnn(cm->input[0].data, weights_ptr,out_vol.data,cm->bias.data, curr_layer);
//exit(0);
	cm->output = out_vol;
	printf("Fatta convoluzione\n");
	if(cm->input->d == 1)
		print_tensor(out_vol);
//printf("\nTENSORE DI OUTPUT: \n");
//print_tensor(out_vol);
/*
free(out_vol.data);

out_vol.data = (tensor_data_t *)calloc(out_vol.w*out_vol.h*out_vol.d, sizeof(tensor_data_t));
convolve_tensors(out_vol.data,cm->input[0].data, weights_ptr, cm->bias.data, curr_layer);
printf("\nTENSORE DI OUTPUT: \n");
print_tensor(out_vol);
*/
	//free_tensor(&out_vol);
}

void print_convolutional_mod(module cm, int print_tensors)
{
	printf("CONVOLUTIONAL MODULE:\n");
	printf("[%d] filters with kernel size: %dx%dx%d\n", cm.n_filters, cm.filters[0].d, cm.ker_w, cm.ker_h);
	printf("bias with size: %dx%dx%d\n", cm.bias.d, cm.bias.w, cm.bias.h);
	printf("Applying horizontal stride of %d and vertical stride of %d\n", cm.stride_w, cm.stride_h);
	
	if(!cm.pad_h && !cm.pad_w) printf("No zero padding\n");
	else printf("Zero padding: horizontal = %d, vertical = %d\n", cm.pad_w, cm.pad_h);
	
	if(print_tensors)
	{
		printf("Input:\n"); 
		if(cm.input)
			print_tensor(cm.input[0]);
		else printf("Input of size\t%dx%dx%d\n", 0, 0, 0);
		printf("\n");
		
		int i;
		for(i = 0; i < cm.n_filters; i++)
		{
			printf("Filter #%d:\n", i);
			print_tensor(cm.filters[i]);
			printf("\n");
		}
		
		printf("Bias:\n");
		print_tensor(cm.bias);
		
		printf("Output:\n"); print_tensor(cm.output);
	}
	else
	{
		if(cm.input)
			printf("input of size\t%dx%dx%d\n", cm.input[0].d, cm.input[0].w, cm.input[0].h);
		else printf("Input of size\t%dx%dx%d\n", 0, 0, 0);
		
		printf("output of size\t%dx%dx%d\n", cm.output.d, cm.output.w, cm.output.h);
	}
}
