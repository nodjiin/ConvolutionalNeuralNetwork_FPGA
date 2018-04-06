# ConvolutionalNeuralNetwork_FPGA

This repo contains both the VivadoHLS project and the Vivado HW - SDK one.
It's a convolutional neural network designed to run on an FPGA (specifically a Xilinx ZedBoard Zynq-7000 ARM/FPGA SoC Development Board).</br>
It features both the code needed to load the network weights from a local file to the DDR (which is done on ARM) and the synthesizable hardware module which is responbile for running all the convolutions.
