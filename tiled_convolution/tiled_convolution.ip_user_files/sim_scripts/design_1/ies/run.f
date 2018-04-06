-makelib ies_lib/xil_defaultlib -sv \
  "/media/dati/dante/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/media/dati/dante/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/media/dati/dante/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/media/dati/dante/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xbip_utils_v3_0_8 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/4173/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/axi_utils_v2_0_4 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/4575/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xbip_pipe_v3_0_4 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ee5e/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xbip_dsp48_wrapper_v3_0_4 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/da55/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xbip_dsp48_addsub_v3_0_4 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/7b8d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xbip_dsp48_multadd_v3_0_4 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/65ba/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xbip_bram18k_v3_0_4 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/9eb4/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/mult_gen_v12_0_13 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/257f/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/floating_point_v7_1_5 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/b20f/hdl/floating_point_v7_1_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/aesl_mux_load_28_35_s.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/convolve4.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_in_channbIp.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_in_channbIp_memcore.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_in_channels.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_in_channmb6.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_in_channmb6_memcore.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_out_chanbNq.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_out_chanbNq_memcore.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_out_channel.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_out_channel_1.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/fifo_w16_d1_A.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/fifo_w16_d1_A_x.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/fifo_w30_d1_A.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/fifo_w32_d1_A.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/fifo_w32_d1_A_x.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/read_in_wh81.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/read_input.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/read_weights.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/set_out_buffer_to_0.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/write_output.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_biasbuf_V.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_control_s_axi.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_fpext_3bkb.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_gmem_m_axi.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mac_muldEe.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mac_mulfYi.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mac_muljbC.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mac_mulkbM.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_16ng8j.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_16nhbi.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_mulcud.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_muleOg.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_mulibs.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_mullbW.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_partialcfu.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_sitofp_bMq.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_srem_17bLp.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_srem_17cHz.v" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_srem_17cIz.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/ip/zhang_cnn_ap_fpext_0_no_dsp_32.vhd" \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/ip/zhang_cnn_ap_sitofp_4_no_dsp_64.vhd" \
  "../../../bd/design_1/ip/design_1_zhang_cnn_0_0/sim/design_1_zhang_cnn_0_0.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_protocol_checker_v2_0_0 -sv \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5c1/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_vip_v1_1_0 -sv \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/8b42/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_2 -sv \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_12 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_rst_processing_system7_0_100M_0/sim/design_1_rst_processing_system7_0_100M_0.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/sim/design_1.v" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_0 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/0798/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_0 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/0798/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_0 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/0798/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_13 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/74ae/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_14 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/a259/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_14 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/33cc/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_auto_pc_1/sim/design_1_auto_pc_1.v" \
  "../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
-endlib
-makelib ies_lib/axi_clock_converter_v2_1_13 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/7d05/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_0 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e50b/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/axi_dwidth_converter_v2_1_14 \
  "../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d498/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_auto_us_0/sim/design_1_auto_us_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

