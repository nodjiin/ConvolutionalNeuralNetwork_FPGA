############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Progetto_hls_cnn
set_top zhang_cnn
add_files Progetto_hls_cnn/src/net_config.hpp
add_files Progetto_hls_cnn/src/net_types.hpp
add_files Progetto_hls_cnn/src/zhang_convolution.cpp
add_files Progetto_hls_cnn/src/zhang_convolution.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/20c-net.cpp
add_files -tb Progetto_hls_cnn/testbench_cpp/activation_functions.cpp
add_files -tb Progetto_hls_cnn/testbench_cpp/activation_functions.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/activation_module.cpp
add_files -tb Progetto_hls_cnn/testbench_cpp/activation_module.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/container_module.cpp
add_files -tb Progetto_hls_cnn/testbench_cpp/container_module.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/convolution.cpp
add_files -tb Progetto_hls_cnn/testbench_cpp/convolution.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/convolutional_module.cpp
add_files -tb Progetto_hls_cnn/testbench_cpp/convolutional_module.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/module.cpp
add_files -tb Progetto_hls_cnn/testbench_cpp/module.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/net_parser.cpp
add_files -tb Progetto_hls_cnn/testbench_cpp/net_parser.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/net_types.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/pool_module.cpp
add_files -tb Progetto_hls_cnn/testbench_cpp/pool_module.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/tensor.cpp
add_files -tb Progetto_hls_cnn/testbench_cpp/tensor.hpp
add_files -tb Progetto_hls_cnn/testbench_cpp/input_files
add_files -tb Progetto_hls_cnn/testbench_cpp/mxml
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./Progetto_hls_cnn/solution1/directives.tcl"
csim_design -ldflags {-I./mxml ./mxml/*.cpp} -clean -compiler gcc
csynth_design
cosim_design -ldflags {-I./mxml ./mxml/*.cpp}
export_design -rtl verilog -format ip_catalog
