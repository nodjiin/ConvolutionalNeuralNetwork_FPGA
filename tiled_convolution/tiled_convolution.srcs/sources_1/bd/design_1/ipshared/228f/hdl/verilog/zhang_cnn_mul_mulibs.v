
`timescale 1 ns / 1 ps

  module zhang_cnn_mul_mulibs_DSP48_4(a, b, p);
input signed [11 - 1 : 0] a; // synthesis attribute keep a "true"
input signed [11 - 1 : 0] b; // synthesis attribute keep b "true"
output signed [11 - 1 : 0] p; // synthesis attribute keep p "true"

assign p = $signed (a) * $signed (b);

endmodule

`timescale 1 ns / 1 ps
module zhang_cnn_mul_mulibs(
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



zhang_cnn_mul_mulibs_DSP48_4 zhang_cnn_mul_mulibs_DSP48_4_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

