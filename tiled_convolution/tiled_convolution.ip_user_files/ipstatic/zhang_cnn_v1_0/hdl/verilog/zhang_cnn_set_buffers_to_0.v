// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module zhang_cnn_set_buffers_to_0 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        curr_layer_str_w,
        curr_layer_str_h,
        outputfm_address0,
        outputfm_ce0,
        outputfm_we0,
        outputfm_d0,
        weightsbuf_address0,
        weightsbuf_ce0,
        weightsbuf_we0,
        weightsbuf_d0,
        inputfm_address0,
        inputfm_ce0,
        inputfm_we0,
        inputfm_d0
);

parameter    ap_ST_st1_fsm_0 = 7'b1;
parameter    ap_ST_st2_fsm_1 = 7'b10;
parameter    ap_ST_st3_fsm_2 = 7'b100;
parameter    ap_ST_st4_fsm_3 = 7'b1000;
parameter    ap_ST_st5_fsm_4 = 7'b10000;
parameter    ap_ST_st6_fsm_5 = 7'b100000;
parameter    ap_ST_st7_fsm_6 = 7'b1000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_6 = 32'b110;
parameter    ap_const_lv4_0 = 4'b0000;
parameter    ap_const_lv9_0 = 9'b000000000;
parameter    ap_const_lv3_0 = 3'b000;
parameter    ap_const_lv5_0 = 5'b00000;
parameter    ap_const_lv9_1A = 9'b11010;
parameter    ap_const_lv4_A = 4'b1010;
parameter    ap_const_lv4_1 = 4'b1;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv6_0 = 6'b000000;
parameter    ap_const_lv3_5 = 3'b101;
parameter    ap_const_lv3_1 = 3'b1;
parameter    ap_const_lv5_1A = 5'b11010;
parameter    ap_const_lv5_1 = 5'b1;
parameter    ap_const_lv13_1A = 13'b11010;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] curr_layer_str_w;
input  [31:0] curr_layer_str_h;
output  [12:0] outputfm_address0;
output   outputfm_ce0;
output   outputfm_we0;
output  [31:0] outputfm_d0;
output  [11:0] weightsbuf_address0;
output   weightsbuf_ce0;
output   weightsbuf_we0;
output  [31:0] weightsbuf_d0;
output  [15:0] inputfm_address0;
output   inputfm_ce0;
output   inputfm_we0;
output  [31:0] inputfm_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg outputfm_ce0;
reg outputfm_we0;
reg weightsbuf_ce0;
reg weightsbuf_we0;
reg inputfm_ce0;
reg inputfm_we0;

(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_24;
wire   [8:0] next_mul2_fu_224_p2;
reg   [8:0] next_mul2_reg_568;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_66;
wire   [31:0] i_cast6_fu_230_p1;
reg   [31:0] i_cast6_reg_573;
wire   [3:0] i_3_fu_240_p2;
reg   [3:0] i_3_reg_581;
wire   [7:0] tmp_112_fu_270_p2;
reg   [7:0] tmp_112_reg_586;
wire   [0:0] exitcond5_fu_234_p2;
wire   [3:0] j_3_fu_282_p2;
reg   [3:0] j_3_reg_594;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_85;
wire   [63:0] tmp_114_fu_313_p2;
reg   [63:0] tmp_114_reg_599;
wire   [0:0] exitcond4_fu_276_p2;
wire   [32:0] tmp_121_cast_fu_349_p1;
reg   [32:0] tmp_121_cast_reg_604;
wire   [2:0] kh_2_fu_359_p2;
reg   [2:0] kh_2_reg_612;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_101;
wire   [12:0] tmp_120_fu_390_p2;
reg   [12:0] tmp_120_reg_617;
wire   [0:0] exitcond3_fu_353_p2;
wire   [2:0] kw_2_fu_402_p2;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_115;
wire   [31:0] next_mul3_fu_422_p2;
reg   [31:0] next_mul3_reg_630;
reg    ap_sig_cseq_ST_st6_fsm_5;
reg    ap_sig_124;
wire   [4:0] r_2_fu_433_p2;
reg   [4:0] r_2_reg_638;
wire   [12:0] tmp_122_fu_453_p2;
reg   [12:0] tmp_122_reg_643;
wire   [0:0] exitcond1_fu_427_p2;
wire   [16:0] tmp_126_fu_497_p2;
reg   [16:0] tmp_126_reg_648;
wire   [4:0] c_2_fu_509_p2;
reg    ap_sig_cseq_ST_st7_fsm_6;
reg    ap_sig_142;
wire   [31:0] next_mul_fu_529_p2;
wire   [0:0] exitcond_fu_503_p2;
reg   [3:0] i_reg_123;
reg   [8:0] phi_mul2_reg_134;
reg   [3:0] j_reg_146;
reg   [2:0] kh_reg_158;
wire   [0:0] exitcond2_fu_396_p2;
reg   [2:0] kw_reg_169;
reg   [4:0] r_reg_180;
reg   [31:0] phi_mul3_reg_191;
reg   [4:0] c_reg_202;
reg   [31:0] phi_mul_reg_213;
wire   [63:0] tmp_131_cast_fu_417_p1;
wire   [63:0] tmp_132_cast_fu_524_p1;
wire   [63:0] tmp_133_cast_fu_553_p1;
wire   [6:0] tmp_s_fu_246_p3;
wire   [4:0] tmp_111_fu_258_p3;
wire   [7:0] p_shl1_cast_fu_266_p1;
wire   [7:0] p_shl_cast_fu_254_p1;
wire   [7:0] tmp_cast_fu_288_p1;
wire   [7:0] tmp_113_fu_292_p2;
wire   [9:0] tmp_fu_301_p3;
wire   [63:0] tmp_116_cast_fu_297_p1;
wire   [63:0] p_shl4_fu_309_p1;
wire   [9:0] tmp_115_fu_319_p3;
wire   [7:0] tmp_116_fu_331_p3;
wire   [10:0] p_shl3_cast_fu_339_p1;
wire   [10:0] p_shl2_cast_fu_327_p1;
wire   [10:0] tmp_117_fu_343_p2;
wire   [63:0] tmp_77_fu_365_p1;
wire   [63:0] tmp_118_fu_369_p2;
wire   [10:0] tmp_119_fu_378_p1;
wire   [12:0] tmp_110_fu_374_p1;
wire   [12:0] p_shl5_cast_fu_382_p3;
wire   [12:0] tmp_82_cast_fu_408_p1;
wire   [12:0] tmp_127_fu_412_p2;
wire   [8:0] tmp_78_cast_fu_439_p1;
wire   [8:0] tmp_121_fu_443_p2;
wire   [8:0] tmp_122_fu_453_p1;
wire   [31:0] tmp_80_fu_459_p2;
wire  signed [32:0] tmp_81_cast_fu_464_p1;
wire   [32:0] tmp_123_fu_468_p2;
wire   [10:0] tmp_124_fu_473_p1;
wire   [12:0] tmp_125_fu_485_p1;
wire   [16:0] p_shl6_cast_fu_477_p3;
wire   [16:0] p_shl7_cast_fu_489_p3;
wire   [12:0] tmp_83_cast_fu_515_p1;
wire   [12:0] tmp_128_fu_519_p2;
wire   [16:0] tmp_130_fu_538_p1;
wire   [16:0] tmp_129_fu_534_p1;
wire   [16:0] tmp_131_fu_542_p2;
wire   [16:0] tmp_132_fu_548_p2;
reg   [6:0] ap_NS_fsm;
wire   [12:0] tmp_122_fu_453_p10;

// power-on initialization
initial begin
#0 ap_CS_fsm = 7'b1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & (1'b0 == exitcond1_fu_427_p2))) begin
        c_reg_202 <= ap_const_lv5_0;
    end else if (((1'b1 == ap_sig_cseq_ST_st7_fsm_6) & (1'b0 == exitcond_fu_503_p2))) begin
        c_reg_202 <= c_2_fu_509_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & ~(1'b0 == exitcond4_fu_276_p2))) begin
        i_reg_123 <= i_3_reg_581;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        i_reg_123 <= ap_const_lv4_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & ~(1'b0 == exitcond1_fu_427_p2))) begin
        j_reg_146 <= j_3_reg_594;
    end else if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_234_p2 == 1'b0))) begin
        j_reg_146 <= ap_const_lv4_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st5_fsm_4) & ~(1'b0 == exitcond2_fu_396_p2))) begin
        kh_reg_158 <= kh_2_reg_612;
    end else if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & (1'b0 == exitcond4_fu_276_p2))) begin
        kh_reg_158 <= ap_const_lv3_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & (1'b0 == exitcond3_fu_353_p2))) begin
        kw_reg_169 <= ap_const_lv3_0;
    end else if (((1'b1 == ap_sig_cseq_ST_st5_fsm_4) & (1'b0 == exitcond2_fu_396_p2))) begin
        kw_reg_169 <= kw_2_fu_402_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & ~(1'b0 == exitcond4_fu_276_p2))) begin
        phi_mul2_reg_134 <= next_mul2_reg_568;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        phi_mul2_reg_134 <= ap_const_lv9_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st7_fsm_6) & ~(1'b0 == exitcond_fu_503_p2))) begin
        phi_mul3_reg_191 <= next_mul3_reg_630;
    end else if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & ~(1'b0 == exitcond3_fu_353_p2))) begin
        phi_mul3_reg_191 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & (1'b0 == exitcond1_fu_427_p2))) begin
        phi_mul_reg_213 <= ap_const_lv32_0;
    end else if (((1'b1 == ap_sig_cseq_ST_st7_fsm_6) & (1'b0 == exitcond_fu_503_p2))) begin
        phi_mul_reg_213 <= next_mul_fu_529_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st7_fsm_6) & ~(1'b0 == exitcond_fu_503_p2))) begin
        r_reg_180 <= r_2_reg_638;
    end else if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & ~(1'b0 == exitcond3_fu_353_p2))) begin
        r_reg_180 <= ap_const_lv5_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        i_3_reg_581 <= i_3_fu_240_p2;
        i_cast6_reg_573[3 : 0] <= i_cast6_fu_230_p1[3 : 0];
        next_mul2_reg_568 <= next_mul2_fu_224_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        j_3_reg_594 <= j_3_fu_282_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        kh_2_reg_612 <= kh_2_fu_359_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        next_mul3_reg_630 <= next_mul3_fu_422_p2;
        r_2_reg_638 <= r_2_fu_433_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_234_p2 == 1'b0))) begin
        tmp_112_reg_586[7 : 1] <= tmp_112_fu_270_p2[7 : 1];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & (1'b0 == exitcond4_fu_276_p2))) begin
        tmp_114_reg_599 <= tmp_114_fu_313_p2;
        tmp_121_cast_reg_604[10 : 4] <= tmp_121_cast_fu_349_p1[10 : 4];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & (1'b0 == exitcond3_fu_353_p2))) begin
        tmp_120_reg_617 <= tmp_120_fu_390_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & (1'b0 == exitcond1_fu_427_p2))) begin
        tmp_122_reg_643 <= tmp_122_fu_453_p2;
        tmp_126_reg_648[16 : 4] <= tmp_126_fu_497_p2[16 : 4];
    end
end

always @ (*) begin
    if ((((1'b0 == ap_start) & (1'b1 == ap_sig_cseq_ST_st1_fsm_0)) | ((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond5_fu_234_p2 == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond5_fu_234_p2 == 1'b0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_24) begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_66) begin
        ap_sig_cseq_ST_st2_fsm_1 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_85) begin
        ap_sig_cseq_ST_st3_fsm_2 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_101) begin
        ap_sig_cseq_ST_st4_fsm_3 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_115) begin
        ap_sig_cseq_ST_st5_fsm_4 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_124) begin
        ap_sig_cseq_ST_st6_fsm_5 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_5 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_142) begin
        ap_sig_cseq_ST_st7_fsm_6 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st7_fsm_6 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        inputfm_ce0 = 1'b1;
    end else begin
        inputfm_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st7_fsm_6) & (1'b0 == exitcond_fu_503_p2))) begin
        inputfm_we0 = 1'b1;
    end else begin
        inputfm_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        outputfm_ce0 = 1'b1;
    end else begin
        outputfm_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st7_fsm_6) & (1'b0 == exitcond_fu_503_p2))) begin
        outputfm_we0 = 1'b1;
    end else begin
        outputfm_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        weightsbuf_ce0 = 1'b1;
    end else begin
        weightsbuf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st5_fsm_4) & (1'b0 == exitcond2_fu_396_p2))) begin
        weightsbuf_we0 = 1'b1;
    end else begin
        weightsbuf_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : begin
            if (~(ap_start == 1'b0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : begin
            if (~(exitcond5_fu_234_p2 == 1'b0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st3_fsm_2 : begin
            if ((1'b0 == exitcond4_fu_276_p2)) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end
        end
        ap_ST_st4_fsm_3 : begin
            if ((1'b0 == exitcond3_fu_353_p2)) begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end else begin
                ap_NS_fsm = ap_ST_st6_fsm_5;
            end
        end
        ap_ST_st5_fsm_4 : begin
            if ((1'b0 == exitcond2_fu_396_p2)) begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end else begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end
        end
        ap_ST_st6_fsm_5 : begin
            if ((1'b0 == exitcond1_fu_427_p2)) begin
                ap_NS_fsm = ap_ST_st7_fsm_6;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st7_fsm_6 : begin
            if ((1'b0 == exitcond_fu_503_p2)) begin
                ap_NS_fsm = ap_ST_st7_fsm_6;
            end else begin
                ap_NS_fsm = ap_ST_st6_fsm_5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

always @ (*) begin
    ap_sig_101 = (1'b1 == ap_CS_fsm[ap_const_lv32_3]);
end

always @ (*) begin
    ap_sig_115 = (1'b1 == ap_CS_fsm[ap_const_lv32_4]);
end

always @ (*) begin
    ap_sig_124 = (1'b1 == ap_CS_fsm[ap_const_lv32_5]);
end

always @ (*) begin
    ap_sig_142 = (1'b1 == ap_CS_fsm[ap_const_lv32_6]);
end

always @ (*) begin
    ap_sig_24 = (ap_CS_fsm[ap_const_lv32_0] == 1'b1);
end

always @ (*) begin
    ap_sig_66 = (1'b1 == ap_CS_fsm[ap_const_lv32_1]);
end

always @ (*) begin
    ap_sig_85 = (1'b1 == ap_CS_fsm[ap_const_lv32_2]);
end

assign c_2_fu_509_p2 = (c_reg_202 + ap_const_lv5_1);

assign exitcond1_fu_427_p2 = ((r_reg_180 == ap_const_lv5_1A) ? 1'b1 : 1'b0);

assign exitcond2_fu_396_p2 = ((kw_reg_169 == ap_const_lv3_5) ? 1'b1 : 1'b0);

assign exitcond3_fu_353_p2 = ((kh_reg_158 == ap_const_lv3_5) ? 1'b1 : 1'b0);

assign exitcond4_fu_276_p2 = ((j_reg_146 == ap_const_lv4_A) ? 1'b1 : 1'b0);

assign exitcond5_fu_234_p2 = ((i_reg_123 == ap_const_lv4_A) ? 1'b1 : 1'b0);

assign exitcond_fu_503_p2 = ((c_reg_202 == ap_const_lv5_1A) ? 1'b1 : 1'b0);

assign i_3_fu_240_p2 = (i_reg_123 + ap_const_lv4_1);

assign i_cast6_fu_230_p1 = i_reg_123;

assign inputfm_address0 = tmp_133_cast_fu_553_p1;

assign inputfm_d0 = ap_const_lv32_0;

assign j_3_fu_282_p2 = (j_reg_146 + ap_const_lv4_1);

assign kh_2_fu_359_p2 = (kh_reg_158 + ap_const_lv3_1);

assign kw_2_fu_402_p2 = (kw_reg_169 + ap_const_lv3_1);

assign next_mul2_fu_224_p2 = (phi_mul2_reg_134 + ap_const_lv9_1A);

assign next_mul3_fu_422_p2 = (phi_mul3_reg_191 + curr_layer_str_h);

assign next_mul_fu_529_p2 = (phi_mul_reg_213 + curr_layer_str_w);

assign outputfm_address0 = tmp_132_cast_fu_524_p1;

assign outputfm_d0 = ap_const_lv32_0;

assign p_shl1_cast_fu_266_p1 = tmp_111_fu_258_p3;

assign p_shl2_cast_fu_327_p1 = tmp_115_fu_319_p3;

assign p_shl3_cast_fu_339_p1 = tmp_116_fu_331_p3;

assign p_shl4_fu_309_p1 = tmp_fu_301_p3;

assign p_shl5_cast_fu_382_p3 = {{tmp_119_fu_378_p1}, {ap_const_lv2_0}};

assign p_shl6_cast_fu_477_p3 = {{tmp_124_fu_473_p1}, {ap_const_lv6_0}};

assign p_shl7_cast_fu_489_p3 = {{tmp_125_fu_485_p1}, {ap_const_lv4_0}};

assign p_shl_cast_fu_254_p1 = tmp_s_fu_246_p3;

assign r_2_fu_433_p2 = (r_reg_180 + ap_const_lv5_1);

assign tmp_110_fu_374_p1 = tmp_118_fu_369_p2[12:0];

assign tmp_111_fu_258_p3 = {{i_reg_123}, {1'b0}};

assign tmp_112_fu_270_p2 = (p_shl1_cast_fu_266_p1 + p_shl_cast_fu_254_p1);

assign tmp_113_fu_292_p2 = (tmp_112_reg_586 + tmp_cast_fu_288_p1);

assign tmp_114_fu_313_p2 = (tmp_116_cast_fu_297_p1 + p_shl4_fu_309_p1);

assign tmp_115_fu_319_p3 = {{j_reg_146}, {ap_const_lv6_0}};

assign tmp_116_cast_fu_297_p1 = tmp_113_fu_292_p2;

assign tmp_116_fu_331_p3 = {{j_reg_146}, {ap_const_lv4_0}};

assign tmp_117_fu_343_p2 = (p_shl3_cast_fu_339_p1 + p_shl2_cast_fu_327_p1);

assign tmp_118_fu_369_p2 = (tmp_114_reg_599 + tmp_77_fu_365_p1);

assign tmp_119_fu_378_p1 = tmp_118_fu_369_p2[10:0];

assign tmp_120_fu_390_p2 = (tmp_110_fu_374_p1 + p_shl5_cast_fu_382_p3);

assign tmp_121_cast_fu_349_p1 = tmp_117_fu_343_p2;

assign tmp_121_fu_443_p2 = (tmp_78_cast_fu_439_p1 + phi_mul2_reg_134);

assign tmp_122_fu_453_p1 = tmp_122_fu_453_p10;

assign tmp_122_fu_453_p10 = tmp_121_fu_443_p2;

assign tmp_122_fu_453_p2 = (ap_const_lv13_1A * tmp_122_fu_453_p1);

assign tmp_123_fu_468_p2 = ($signed(tmp_81_cast_fu_464_p1) + $signed(tmp_121_cast_reg_604));

assign tmp_124_fu_473_p1 = tmp_123_fu_468_p2[10:0];

assign tmp_125_fu_485_p1 = tmp_123_fu_468_p2[12:0];

assign tmp_126_fu_497_p2 = (p_shl6_cast_fu_477_p3 + p_shl7_cast_fu_489_p3);

assign tmp_127_fu_412_p2 = (tmp_120_reg_617 + tmp_82_cast_fu_408_p1);

assign tmp_128_fu_519_p2 = (tmp_83_cast_fu_515_p1 + tmp_122_reg_643);

assign tmp_129_fu_534_p1 = phi_mul_reg_213[16:0];

assign tmp_130_fu_538_p1 = j_reg_146;

assign tmp_131_cast_fu_417_p1 = tmp_127_fu_412_p2;

assign tmp_131_fu_542_p2 = (tmp_130_fu_538_p1 + tmp_129_fu_534_p1);

assign tmp_132_cast_fu_524_p1 = tmp_128_fu_519_p2;

assign tmp_132_fu_548_p2 = (tmp_131_fu_542_p2 + tmp_126_reg_648);

assign tmp_133_cast_fu_553_p1 = tmp_132_fu_548_p2;

assign tmp_77_fu_365_p1 = kh_reg_158;

assign tmp_78_cast_fu_439_p1 = r_reg_180;

assign tmp_80_fu_459_p2 = (i_cast6_reg_573 + phi_mul3_reg_191);

assign tmp_81_cast_fu_464_p1 = $signed(tmp_80_fu_459_p2);

assign tmp_82_cast_fu_408_p1 = kw_reg_169;

assign tmp_83_cast_fu_515_p1 = c_reg_202;

assign tmp_cast_fu_288_p1 = j_reg_146;

assign tmp_fu_301_p3 = {{tmp_113_fu_292_p2}, {ap_const_lv2_0}};

assign tmp_s_fu_246_p3 = {{i_reg_123}, {ap_const_lv3_0}};

assign weightsbuf_address0 = tmp_131_cast_fu_417_p1;

assign weightsbuf_d0 = ap_const_lv32_0;

always @ (posedge ap_clk) begin
    i_cast6_reg_573[31:4] <= 28'b0000000000000000000000000000;
    tmp_112_reg_586[0] <= 1'b0;
    tmp_121_cast_reg_604[3:0] <= 4'b0000;
    tmp_121_cast_reg_604[32:11] <= 22'b0000000000000000000000;
    tmp_126_reg_648[3:0] <= 4'b0000;
end

endmodule //zhang_cnn_set_buffers_to_0