<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="com.autoesl.autopilot.project" name="Tiled_cnn_hls" top="zhang_cnn" onlyArchiveActiveSoluton="false">
  <files>
    <file name="Progetto_hls_cnn/src/net_config.hpp" sc="0" tb="false" cflags=""/>
    <file name="Progetto_hls_cnn/src/net_types.hpp" sc="0" tb="false" cflags=""/>
    <file name="Progetto_hls_cnn/src/zhang_convolution.cpp" sc="0" tb="false" cflags=""/>
    <file name="Progetto_hls_cnn/src/zhang_convolution.hpp" sc="0" tb="false" cflags=""/>
    <file name="../testbench_cpp/20c-net.cpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/activation_functions.cpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/activation_functions.hpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/activation_module.cpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/activation_module.hpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/container_module.cpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/container_module.hpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/convolution.cpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/convolution.hpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/convolutional_module.cpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/convolutional_module.hpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/module.cpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/module.hpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/net_parser.cpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/net_parser.hpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/net_types.hpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/pool_module.cpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/pool_module.hpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/tensor.cpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/tensor.hpp" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/input_files" sc="0" tb="1" cflags=""/>
    <file name="../testbench_cpp/mxml" sc="0" tb="1" cflags=""/>
  </files>
  <solutions>
    <solution name="solution1" status="active"/>
  </solutions>
  <includePaths/>
  <libraryPaths/>
  <Simulation argv="">
    <SimFlow name="csim" ldflags="-I./mxml ./mxml/*.cpp" clean="true" csimMode="0" lastCsimMode="0" compiler="true"/>
  </Simulation>
</project>
