/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module tester_3 (
    input [5:0] alufn_dip,
    input [15:0] b_dip,
    input clk,
    input rst,
    input alu_z,
    input alu_v,
    input alu_n,
    input [15:0] alu_out,
    input mode,
    input type,
    output reg [15:0] a_out,
    output reg [15:0] b_out,
    output reg [7:0] out,
    output reg [5:0] alufn_out,
    output reg [7:0] fsmout
  );
  
  
  
  reg [15:0] a;
  
  reg [15:0] b;
  
  reg [15:0] add_ans;
  
  reg [15:0] sub_ans;
  
  reg [15:0] mult_ans;
  
  reg [15:0] shl_ans;
  
  reg [15:0] shr_ans;
  
  reg [15:0] sra_ans;
  
  localparam PASS_NUM_STATES = 6'h33;
  
  localparam FAIL_NUM_STATES = 5'h14;
  
  reg err1;
  
  reg err2;
  
  reg err3;
  
  reg err4;
  
  reg err5;
  
  wire [1-1:0] M_slowclk_value;
  counter_2 slowclk (
    .clk(clk),
    .rst(rst),
    .value(M_slowclk_value)
  );
  
  localparam ADD1_pass_fsm = 6'd0;
  localparam ADD2_pass_fsm = 6'd1;
  localparam ADD3_pass_fsm = 6'd2;
  localparam ADD4_pass_fsm = 6'd3;
  localparam ADD5_pass_fsm = 6'd4;
  localparam SUB1_pass_fsm = 6'd5;
  localparam SUB2_pass_fsm = 6'd6;
  localparam SUB3_pass_fsm = 6'd7;
  localparam SUB4_pass_fsm = 6'd8;
  localparam SUB5_pass_fsm = 6'd9;
  localparam NNUL_pass_fsm = 6'd10;
  localparam EQ1_pass_fsm = 6'd11;
  localparam EQ2_pass_fsm = 6'd12;
  localparam EQ3_pass_fsm = 6'd13;
  localparam EQ4_pass_fsm = 6'd14;
  localparam EQ5_pass_fsm = 6'd15;
  localparam EQ6_pass_fsm = 6'd16;
  localparam LT1_pass_fsm = 6'd17;
  localparam LT2_pass_fsm = 6'd18;
  localparam LT3_pass_fsm = 6'd19;
  localparam LT4_pass_fsm = 6'd20;
  localparam LT5_pass_fsm = 6'd21;
  localparam LE1_pass_fsm = 6'd22;
  localparam LE2_pass_fsm = 6'd23;
  localparam LE3_pass_fsm = 6'd24;
  localparam LE4_pass_fsm = 6'd25;
  localparam LE5_pass_fsm = 6'd26;
  localparam AND1_pass_fsm = 6'd27;
  localparam AND2_pass_fsm = 6'd28;
  localparam OR1_pass_fsm = 6'd29;
  localparam OR2_pass_fsm = 6'd30;
  localparam XOR1_pass_fsm = 6'd31;
  localparam XOR2_pass_fsm = 6'd32;
  localparam A1_pass_fsm = 6'd33;
  localparam A2_pass_fsm = 6'd34;
  localparam SHL1_pass_fsm = 6'd35;
  localparam SHL2_pass_fsm = 6'd36;
  localparam SHL3_pass_fsm = 6'd37;
  localparam SHL4_pass_fsm = 6'd38;
  localparam SHL5_pass_fsm = 6'd39;
  localparam SHR1_pass_fsm = 6'd40;
  localparam SHR2_pass_fsm = 6'd41;
  localparam SHR3_pass_fsm = 6'd42;
  localparam SHR4_pass_fsm = 6'd43;
  localparam SHR5_pass_fsm = 6'd44;
  localparam SRA1_pass_fsm = 6'd45;
  localparam SRA2_pass_fsm = 6'd46;
  localparam SRA3_pass_fsm = 6'd47;
  localparam SRA4_pass_fsm = 6'd48;
  localparam SRA5_pass_fsm = 6'd49;
  localparam SRA6_pass_fsm = 6'd50;
  
  reg [5:0] M_pass_fsm_d, M_pass_fsm_q = ADD1_pass_fsm;
  localparam ADD1_fail_fsm = 5'd0;
  localparam ADD2_fail_fsm = 5'd1;
  localparam SUB1_fail_fsm = 5'd2;
  localparam SUB2_fail_fsm = 5'd3;
  localparam NNUL_fail_fsm = 5'd4;
  localparam EQ1_fail_fsm = 5'd5;
  localparam EQ2_fail_fsm = 5'd6;
  localparam LT1_fail_fsm = 5'd7;
  localparam LT2_fail_fsm = 5'd8;
  localparam LE1_fail_fsm = 5'd9;
  localparam AND1_fail_fsm = 5'd10;
  localparam OR1_fail_fsm = 5'd11;
  localparam OR2_fail_fsm = 5'd12;
  localparam XOR2_fail_fsm = 5'd13;
  localparam A2_fail_fsm = 5'd14;
  localparam SHL1_fail_fsm = 5'd15;
  localparam SHL2_fail_fsm = 5'd16;
  localparam SHR1_fail_fsm = 5'd17;
  localparam SHR2_fail_fsm = 5'd18;
  localparam SRA1_fail_fsm = 5'd19;
  
  reg [4:0] M_fail_fsm_d, M_fail_fsm_q = ADD1_fail_fsm;
  
  always @* begin
    M_fail_fsm_d = M_fail_fsm_q;
    M_pass_fsm_d = M_pass_fsm_q;
    
    alufn_out = 1'h0;
    out = 1'h0;
    a = 1'h0;
    b = 1'h0;
    err1 = 1'h0;
    err2 = 1'h0;
    err3 = 1'h0;
    err4 = 1'h0;
    err5 = 1'h0;
    a_out = a;
    b_out = b;
    fsmout = 1'h0;
    if (mode) begin
      a = 16'hfcb8;
      b = b_dip[0+15-:16];
      a_out = a;
      b_out = b;
      add_ans = a + b;
      sub_ans = a - b;
      mult_ans = a * b;
      shl_ans = a << b;
      shr_ans = a >> b;
      sra_ans = $signed(a) >>> b;
      out = 1'h0;
      alufn_out = alufn_dip;
      
      case (alufn_dip)
        6'h00: begin
          out[0+7-:8] = {4'h8{(alu_out == add_ans)}};
        end
        6'h01: begin
          out[0+7-:8] = {4'h8{(alu_out == sub_ans)}};
        end
        6'h02: begin
          out[0+7-:8] = {4'h8{(alu_out == mult_ans)}};
        end
        6'h3f: begin
          out[0+7-:8] = {4'h8{(alu_out == (a + b))}};
        end
        6'h20: begin
          out[0+7-:8] = {4'h8{(alu_out == shl_ans)}};
        end
        6'h21: begin
          out[0+7-:8] = {4'h8{(alu_out == shr_ans)}};
        end
        6'h23: begin
          out[0+7-:8] = {4'h8{(alu_out == sra_ans)}};
        end
        6'h18: begin
          out[0+7-:8] = {4'h8{(alu_out == (a & b))}};
        end
        6'h1e: begin
          out[0+7-:8] = {4'h8{(alu_out == (a | b))}};
        end
        6'h16: begin
          out[0+7-:8] = {4'h8{(alu_out == (a ^ b))}};
        end
        6'h1a: begin
          out[0+7-:8] = {4'h8{(alu_out == a)}};
        end
        6'h33: begin
          out[0+7-:8] = {4'h8{(alu_out == (a == b))}};
        end
        6'h35: begin
          out[0+7-:8] = {4'h8{(alu_out == ($signed(a) < $signed(b)))}};
        end
        6'h37: begin
          out[0+7-:8] = {4'h8{(alu_out == ($signed(a) <= $signed(b)))}};
        end
      endcase
    end else begin
      if (type == 1'h0) begin
        fsmout = M_pass_fsm_q;
        M_pass_fsm_d = M_pass_fsm_q + 1'h1;
        if (M_pass_fsm_q == 6'h32) begin
          M_pass_fsm_d = 1'h0;
        end
        
        case (M_pass_fsm_q)
          ADD1_pass_fsm: begin
            a = 16'h0001;
            b = 16'h0001;
            alufn_out = 16'h0000;
            err1 = alu_out != 16'h0002;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          ADD2_pass_fsm: begin
            a = 16'hffff;
            b = 16'hffff;
            alufn_out = 16'h0000;
            err1 = alu_out != 16'hfffe;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          ADD3_pass_fsm: begin
            a = 16'h0102;
            b = 16'hfed5;
            alufn_out = 16'h0000;
            err1 = alu_out != 16'hffd7;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          ADD4_pass_fsm: begin
            a = 16'h8000;
            b = 16'h8000;
            alufn_out = 16'h0000;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          ADD5_pass_fsm: begin
            a = 16'h4000;
            b = 16'h4000;
            alufn_out = 16'h0000;
            err1 = alu_out != 16'h8000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h1;
          end
          SUB1_pass_fsm: begin
            a = 16'h0001;
            b = 16'h0001;
            alufn_out = 16'h0001;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SUB2_pass_fsm: begin
            a = 16'hffff;
            b = 16'hffff;
            alufn_out = 16'h0001;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SUB3_pass_fsm: begin
            a = 16'h0dac;
            b = 16'hf628;
            alufn_out = 16'h0001;
            err1 = alu_out != 16'h1784;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SUB4_pass_fsm: begin
            a = 16'h4e20;
            b = 16'hc568;
            alufn_out = 16'h0001;
            err1 = alu_out != 16'h88b8;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h1;
          end
          SUB5_pass_fsm: begin
            a = 16'h8ad0;
            b = 16'h1388;
            alufn_out = 16'h0001;
            err1 = alu_out != 16'h7748;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          NNUL_pass_fsm: begin
            a = 16'h041a;
            b = 16'h07d0;
            alufn_out = 16'h0002;
            err1 = alu_out != 16'h0b20;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          EQ1_pass_fsm: begin
            a = 16'h000b;
            b = 16'h001f;
            alufn_out = 16'h0033;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          EQ2_pass_fsm: begin
            a = 16'h001f;
            b = 16'h000b;
            alufn_out = 16'h0033;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          EQ3_pass_fsm: begin
            a = 16'h0000;
            b = 16'h0000;
            alufn_out = 16'h0033;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          EQ4_pass_fsm: begin
            a = 16'hffff;
            b = 16'hffff;
            alufn_out = 16'h0033;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          EQ5_pass_fsm: begin
            a = 16'h000b;
            b = 16'h000b;
            alufn_out = 16'h0033;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          EQ6_pass_fsm: begin
            a = 16'h0001;
            b = 16'h0001;
            alufn_out = 16'h0033;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          LT1_pass_fsm: begin
            a = 16'h000b;
            b = 16'h001f;
            alufn_out = 16'h0035;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          LT2_pass_fsm: begin
            a = 16'h001f;
            b = 16'h000b;
            alufn_out = 16'h0035;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          LT3_pass_fsm: begin
            a = 16'h0000;
            b = 16'h0000;
            alufn_out = 16'h0035;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          LT4_pass_fsm: begin
            a = 16'hffff;
            b = 16'hffff;
            alufn_out = 16'h0035;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          LT5_pass_fsm: begin
            a = 16'h000b;
            b = 16'h000b;
            alufn_out = 16'h0035;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          LE1_pass_fsm: begin
            a = 16'h000b;
            b = 16'h001f;
            alufn_out = 16'h0037;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          LE2_pass_fsm: begin
            a = 16'h001f;
            b = 16'h000b;
            alufn_out = 16'h0037;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          LE3_pass_fsm: begin
            a = 16'h0000;
            b = 16'h0000;
            alufn_out = 16'h0037;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          LE4_pass_fsm: begin
            a = 16'hffff;
            b = 16'hffff;
            alufn_out = 16'h0037;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          LE5_pass_fsm: begin
            a = 16'h000b;
            b = 16'h000b;
            alufn_out = 16'h0037;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          AND1_pass_fsm: begin
            a = 16'h4789;
            b = 16'h1a0e;
            alufn_out = 16'h0018;
            err1 = alu_out != 16'h0208;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          AND2_pass_fsm: begin
            a = 16'hffff;
            b = 16'h000a;
            alufn_out = 16'h0018;
            err1 = alu_out != 16'h000a;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          OR1_pass_fsm: begin
            a = 16'h8880;
            b = 16'h9949;
            alufn_out = 16'h001e;
            err1 = alu_out != 16'h99c9;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          OR2_pass_fsm: begin
            a = 16'hffff;
            b = 16'h200a;
            alufn_out = 16'h001e;
            err1 = alu_out != 16'hffff;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          XOR1_pass_fsm: begin
            a = 16'h9a26;
            b = 16'h8008;
            alufn_out = 16'h0016;
            err1 = alu_out != 16'h1a2e;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          XOR2_pass_fsm: begin
            a = 16'hd524;
            b = 16'hffe7;
            alufn_out = 16'h0016;
            err1 = alu_out != 16'h2ac3;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          A1_pass_fsm: begin
            a = 16'h9999;
            b = 16'h0008;
            alufn_out = 16'h001a;
            err1 = alu_out != 16'h9999;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          A2_pass_fsm: begin
            a = 16'h0101;
            b = 16'h7397;
            alufn_out = 16'h001a;
            err1 = alu_out != 16'h0101;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SHL1_pass_fsm: begin
            a = 16'h0001;
            b = 16'h0001;
            alufn_out = 16'h0020;
            err1 = alu_out != 16'h0002;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SHL2_pass_fsm: begin
            a = 16'h0001;
            b = 16'h000f;
            alufn_out = 16'h0020;
            err1 = alu_out != 16'h8000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SHL3_pass_fsm: begin
            a = 16'hffff;
            b = 16'h000a;
            alufn_out = 16'h0020;
            err1 = alu_out != 16'hfc00;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SHL4_pass_fsm: begin
            a = 16'h9999;
            b = 16'h0008;
            alufn_out = 16'h0020;
            err1 = alu_out != 16'h9900;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          SHL5_pass_fsm: begin
            a = 16'h8880;
            b = 16'h0009;
            alufn_out = 16'h0020;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          SHR1_pass_fsm: begin
            a = 16'h8000;
            b = 16'h0001;
            alufn_out = 16'h0021;
            err1 = alu_out != 16'h4000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          SHR2_pass_fsm: begin
            a = 16'h8000;
            b = 16'h000f;
            alufn_out = 16'h0021;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          SHR3_pass_fsm: begin
            a = 16'hffff;
            b = 16'h000a;
            alufn_out = 16'h0021;
            err1 = alu_out != 16'h003f;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          SHR4_pass_fsm: begin
            a = 16'h9999;
            b = 16'h0008;
            alufn_out = 16'h0021;
            err1 = alu_out != 16'h0099;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          SHR5_pass_fsm: begin
            a = 16'h0111;
            b = 16'h0009;
            alufn_out = 16'h0021;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SRA1_pass_fsm: begin
            a = 16'h8000;
            b = 16'h0001;
            alufn_out = 16'h0023;
            err1 = alu_out != 16'hc000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          SRA2_pass_fsm: begin
            a = 16'h4000;
            b = 16'h000e;
            alufn_out = 16'h0023;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SRA3_pass_fsm: begin
            a = 16'hffff;
            b = 16'h000a;
            alufn_out = 16'h0023;
            err1 = alu_out != 16'hffff;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          SRA4_pass_fsm: begin
            a = 16'h9999;
            b = 16'h0008;
            alufn_out = 16'h0023;
            err1 = alu_out != 16'hff99;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          SRA5_pass_fsm: begin
            a = 16'h0111;
            b = 16'h0009;
            alufn_out = 16'h0023;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SRA6_pass_fsm: begin
            a = 16'h7fff;
            b = 16'h0007;
            alufn_out = 16'h0023;
            err1 = alu_out != 16'h00ff;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
        endcase
      end else begin
        fsmout = M_fail_fsm_q;
        M_fail_fsm_d = M_fail_fsm_q + 1'h1;
        if (M_fail_fsm_q == 5'h14) begin
          M_fail_fsm_d = 1'h0;
        end
        
        case (M_fail_fsm_q)
          ADD1_fail_fsm: begin
            a = 16'h0001;
            b = 16'h0001;
            alufn_out = 16'h0010;
            err1 = alu_out != 16'h0002;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          ADD2_fail_fsm: begin
            a = 16'hffff;
            b = 16'hffff;
            alufn_out = 16'h0000;
            err1 = alu_out != 16'hfffe;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SUB1_fail_fsm: begin
            a = 16'h0001;
            b = 16'h0001;
            alufn_out = 16'h0001;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          SUB2_fail_fsm: begin
            a = 16'hffff;
            b = 16'hffff;
            alufn_out = 16'h0001;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          NNUL_fail_fsm: begin
            a = 16'h041a;
            b = 16'h07d0;
            alufn_out = 16'h0002;
            err1 = alu_out != 16'h0b21;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          EQ1_fail_fsm: begin
            a = 16'h000b;
            b = 16'h001f;
            alufn_out = 16'h0033;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          EQ2_fail_fsm: begin
            a = 16'h001f;
            b = 16'h000b;
            alufn_out = 16'h0033;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          LT1_fail_fsm: begin
            a = 16'h000b;
            b = 16'h001f;
            alufn_out = 16'h0035;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h1;
          end
          LT2_fail_fsm: begin
            a = 16'h001f;
            b = 16'h000b;
            alufn_out = 16'h0035;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          LE1_fail_fsm: begin
            a = 16'h000b;
            b = 16'h001f;
            alufn_out = 16'h0036;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h1;
          end
          AND1_fail_fsm: begin
            a = 16'h4789;
            b = 16'h1a0e;
            alufn_out = 16'h0018;
            err1 = alu_out != 16'h0209;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          OR1_fail_fsm: begin
            a = 16'h8880;
            b = 16'h9949;
            alufn_out = 16'h001e;
            err1 = alu_out != 16'h99c9;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
          OR2_fail_fsm: begin
            a = 16'hffff;
            b = 16'h200a;
            alufn_out = 16'h001e;
            err1 = alu_out != 16'hffff;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h1;
          end
          XOR2_fail_fsm: begin
            a = 16'hd524;
            b = 16'hffe7;
            alufn_out = 16'h0016;
            err1 = alu_out != 16'h2ac3;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h1;
          end
          A2_fail_fsm: begin
            a = 16'h0101;
            b = 16'h7397;
            alufn_out = 16'h001b;
            err1 = alu_out != 16'h0101;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SHL1_fail_fsm: begin
            a = 16'h0001;
            b = 16'h0001;
            alufn_out = 16'h0020;
            err1 = alu_out != 16'h0000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SHL2_fail_fsm: begin
            a = 16'h0001;
            b = 16'h000f;
            alufn_out = 16'h0020;
            err1 = alu_out != 16'h8000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SHR1_fail_fsm: begin
            a = 16'h8000;
            b = 16'h0001;
            alufn_out = 16'h0021;
            err1 = alu_out != 16'h4000;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h0;
            err4 = alu_n != 1'h0;
          end
          SHR2_fail_fsm: begin
            a = 16'h8000;
            b = 16'h000f;
            alufn_out = 16'h0021;
            err1 = alu_out != 16'h0001;
            err2 = alu_z != 1'h0;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h1;
          end
          SRA1_fail_fsm: begin
            a = 16'h8000;
            b = 16'h0001;
            alufn_out = 16'h0022;
            err1 = alu_out != 16'hc000;
            err2 = alu_z != 1'h1;
            err3 = alu_v != 1'h1;
            err4 = alu_n != 1'h0;
          end
        endcase
      end
      
      case (alufn_dip)
        6'h00: begin
          err5 = 1'h0;
        end
        6'h01: begin
          err5 = 1'h0;
        end
        6'h02: begin
          err5 = 1'h0;
        end
        6'h3f: begin
          err5 = 1'h0;
        end
        6'h20: begin
          err5 = 1'h0;
        end
        6'h21: begin
          err5 = 1'h0;
        end
        6'h23: begin
          err5 = 1'h0;
        end
        6'h18: begin
          err5 = 1'h0;
        end
        6'h1e: begin
          err5 = 1'h0;
        end
        6'h16: begin
          err5 = 1'h0;
        end
        6'h1a: begin
          err5 = 1'h0;
        end
        6'h33: begin
          err5 = 1'h0;
        end
        6'h35: begin
          err5 = 1'h0;
        end
        6'h37: begin
          err5 = 1'h0;
        end
        default: begin
          err5 = 1'h1;
        end
      endcase
      a_out = a;
      b_out = b;
      out[7+0-:1] = err1;
      out[6+0-:1] = err2;
      out[5+0-:1] = err3;
      out[4+0-:1] = err4;
      out[3+0-:1] = err5;
    end
  end
  
  always @(posedge M_slowclk_value) begin
    if (rst == 1'b1) begin
      M_pass_fsm_q <= 1'h0;
      M_fail_fsm_q <= 1'h0;
    end else begin
      M_pass_fsm_q <= M_pass_fsm_d;
      M_fail_fsm_q <= M_fail_fsm_d;
    end
  end
  
endmodule
