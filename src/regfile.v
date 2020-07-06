/* 16x16-bit registers */

`timescale 1ns/1ns

`include "dmux4x16.v"
`include "reg16.v"

`ifndef _regfile
`define _regfile

/* 
  example instruction:
  ADD R0,R1,R2

  | Ins  | Rd   | Ra   | Rb   |
  | ---- | ---- | ---- | ---- |
  | ADD  | R0   | R1   | R2   |
  | 0000 | 0001 | 0010 | 0011 |

*/

module regfile(
  input  clk,          // clock signal
  input  rst,          // reset signal
  input  wen,          // write enable
  input  [3:0]  selRd, // selector for Rd
  input  [3:0]  selRs, // selector for Rs
  input  [3:0]  selRt, // selector for Rt
  input  [15:0] rd,    // data to write to Rd
  output [15:0] rs,    // Rs data from selected register
  output [15:0] rt     // Rt data from selected register
);

  wire [15:0] enRd; // enable signals for Rd selection
  wire [15:0] enRs; // enable signals for Rs selection
  wire [15:0] enRt; // enable signals for Rt selection

  // three 4x16 dmux for selecting registers
  dmux4x16 d0(.en(wen),  .sel(selRd), .d(enRd));
  dmux4x16 d1(.en(1'b1), .sel(selRs), .d(enRs));
  dmux4x16 d2(.en(1'b1), .sel(selRt), .d(enRt));

  reg16 r00(.clk(clk), .rst(rst), .en(enRd[0]),  .selA(enRs[0]),  .selB(enRt[0]),  .d(rd), .a(rs), .b(rt));
  reg16 r01(.clk(clk), .rst(rst), .en(enRd[1]),  .selA(enRs[1]),  .selB(enRt[1]),  .d(rd), .a(rs), .b(rt));
  reg16 r02(.clk(clk), .rst(rst), .en(enRd[2]),  .selA(enRs[2]),  .selB(enRt[2]),  .d(rd), .a(rs), .b(rt));
  reg16 r03(.clk(clk), .rst(rst), .en(enRd[3]),  .selA(enRs[3]),  .selB(enRt[3]),  .d(rd), .a(rs), .b(rt));
  reg16 r04(.clk(clk), .rst(rst), .en(enRd[4]),  .selA(enRs[4]),  .selB(enRt[4]),  .d(rd), .a(rs), .b(rt));
  reg16 r05(.clk(clk), .rst(rst), .en(enRd[5]),  .selA(enRs[5]),  .selB(enRt[5]),  .d(rd), .a(rs), .b(rt));
  reg16 r06(.clk(clk), .rst(rst), .en(enRd[6]),  .selA(enRs[6]),  .selB(enRt[6]),  .d(rd), .a(rs), .b(rt));
  reg16 r07(.clk(clk), .rst(rst), .en(enRd[7]),  .selA(enRs[7]),  .selB(enRt[7]),  .d(rd), .a(rs), .b(rt));
  reg16 r08(.clk(clk), .rst(rst), .en(enRd[8]),  .selA(enRs[8]),  .selB(enRt[8]),  .d(rd), .a(rs), .b(rt));
  reg16 r09(.clk(clk), .rst(rst), .en(enRd[9]),  .selA(enRs[9]),  .selB(enRt[9]),  .d(rd), .a(rs), .b(rt));
  reg16 r10(.clk(clk), .rst(rst), .en(enRd[10]), .selA(enRs[10]), .selB(enRt[10]), .d(rd), .a(rs), .b(rt));
  reg16 r11(.clk(clk), .rst(rst), .en(enRd[11]), .selA(enRs[11]), .selB(enRt[11]), .d(rd), .a(rs), .b(rt));
  reg16 r12(.clk(clk), .rst(rst), .en(enRd[12]), .selA(enRs[12]), .selB(enRt[12]), .d(rd), .a(rs), .b(rt));
  reg16 r13(.clk(clk), .rst(rst), .en(enRd[13]), .selA(enRs[13]), .selB(enRt[13]), .d(rd), .a(rs), .b(rt));
  reg16 r14(.clk(clk), .rst(rst), .en(enRd[14]), .selA(enRs[14]), .selB(enRt[14]), .d(rd), .a(rs), .b(rt));
  reg16 r15(.clk(clk), .rst(rst), .en(enRd[15]), .selA(enRs[15]), .selB(enRt[15]), .d(rd), .a(rs), .b(rt));

endmodule

`endif