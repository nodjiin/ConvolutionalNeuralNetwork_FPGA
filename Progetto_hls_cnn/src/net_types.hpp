#ifndef NET_TYPES_H
#define NET_TYPES_H

#include <ap_int.h>
#include <ap_fixed.h>
//#include <ap_fixed_sim.h>

#define N_INIT_ARG_CONV 10
#define N_INIT_ARG_POOL 6
#define N_INIT_ARG_ACTIV 1
#define N_INIT_ARG_CONT 3

#define DEPTH 1
#define HEIGHT 2
#define WIDTH 3

//#define DATA_FORMAT_STR "%lf"
//#define DATA_FORMAT_STR_SP "%lf "
#define DATA_FORMAT_STR "%f"
#define DATA_FORMAT_STR_SP "%f "

//typedef double tensor_data_t;
typedef float tensor_data_t;
/*
typedef float tensor_data_t_hw;
typedef float tensor_data_t_hw_o;
typedef float tensor_data_t_hw_w;

/*
	Those sizes ensure you only need 1 DSP for each operation, since the DSPs on our board
	have a 25bit input, an 18bit one, and a 48bit output/accumulator for mac.
	The integer part is as small as possible, while preserving the information.
	If your net has input/weights values with an integer part greater than ours,
	you'll need to increase the number of bits dedicated to the integer part.
*/

typedef ap_fixed<25,5> tensor_data_t_hw;
typedef ap_fixed<18,1> tensor_data_t_hw_w;
typedef ap_fixed<48,6> tensor_data_t_hw_o;

typedef long unsigned int address_t;

long unsigned int _mem_alloc_by_model;
long unsigned int _mem_alloc_by_volumes;

typedef struct
{
	int d;
	int h;
	int w;
	tensor_data_t *data;
	address_t data_addr;
} tensor;

typedef enum
{
	IDENTITY,
	BIN_STEP,
	SIGMOID,
	TANH,
	ARCTAN,
	SOFTSIGN,
	RELU,
	PRELU,
	ELU,
	SIN
} activation_t;

typedef enum
{
	CONVOLUTIONAL = 1,
	CONTAINER,
	POOL,
	ACTIVATION
} module_t;

typedef enum
{
	SEQUENTIAL, // one module's output goes to the next module's input
	CONCAT // each module share the same input and their output is concatenated along a selected dimension
	// EXTEND TYPES
} container_t;

typedef struct module
{	// BASICS
	module_t type;
	
	tensor *input; // this points to the output of the previous module, or to the network input 
	tensor output;
	
	// CONVOLUTIONAL
	int n_filters;
	tensor *filters;
	tensor bias;
	
	int pad_h, pad_w;
	int stride_h, stride_w;
	
	// POOL
	int ker_h, ker_w;
	
	// ACTIVATION
	activation_t act_type;
	
	// CONTAINER
	container_t cont_type;
	int concat_dim; // only if cont_type = CONCAT; concat_dim = 0 in case of other container types
	int n_modules;
	struct module *modules;
} module;

typedef struct layer_config {
  short n_layer; //id layer
  short in_w;  // input dimensions
  short in_h;
  short out_w;
  short out_h;
  short in_ch;
  short out_ch;
  short ker_w;
  short ker_h;
  short ker_ch;
  short str_w;
  short str_h;
  short pad_w;
  short pad_h;
  short relu;
  short has_bias;
  activation_t act_type;
} layer_config;

#endif
