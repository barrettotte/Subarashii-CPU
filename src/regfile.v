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
  | TBD? | 0001 | 0010 | 0011 |

*/

module regfile(
  input  clk,          // clock signal
  input  rst,          // reset signal
  input  wen,          // write enable
  input  [3:0]  selRd, // selector for Rd
  input  [3:0]  selRa, // selector for Ra
  input  [3:0]  selRb, // selector for Rb
  input  [15:0] rd,    // data to write to Rd
  output [15:0] ra,    // Ra data from selected register
  output [15:0] rb     // Rb data from selected register
);

  wire [15:0] enRd; // enable signals for Rd selection
  wire [15:0] enRa; // enable signals for Ra selection
  wire [15:0] enRb; // enable signals for Rb selection

  // three 4x16 dmux for selecting registers
  dmux4x16 d0(.en(wen),  .sel(selRd), .d(enRd));
  dmux4x16 d1(.en(1'b1), .sel(selRa), .d(enRa));
  dmux4x16 d2(.en(1'b1), .sel(selRb), .d(enRb));

  reg16 r00(.clk(clk), .rst(rst), .en(enRd[0]),  .selA(enRa[0]),  .selB(enRb[0]),  .bus(rd), .a(ra), .b(rb));
  reg16 r01(.clk(clk), .rst(rst), .en(enRd[1]),  .selA(enRa[1]),  .selB(enRb[1]),  .bus(rd), .a(ra), .b(rb));
  reg16 r02(.clk(clk), .rst(rst), .en(enRd[2]),  .selA(enRa[2]),  .selB(enRb[2]),  .bus(rd), .a(ra), .b(rb));
  reg16 r03(.clk(clk), .rst(rst), .en(enRd[3]),  .selA(enRa[3]),  .selB(enRb[3]),  .bus(rd), .a(ra), .b(rb));
  reg16 r04(.clk(clk), .rst(rst), .en(enRd[4]),  .selA(enRa[4]),  .selB(enRb[4]),  .bus(rd), .a(ra), .b(rb));
  reg16 r05(.clk(clk), .rst(rst), .en(enRd[5]),  .selA(enRa[5]),  .selB(enRb[5]),  .bus(rd), .a(ra), .b(rb));
  reg16 r06(.clk(clk), .rst(rst), .en(enRd[6]),  .selA(enRa[6]),  .selB(enRb[6]),  .bus(rd), .a(ra), .b(rb));
  reg16 r07(.clk(clk), .rst(rst), .en(enRd[7]),  .selA(enRa[7]),  .selB(enRb[7]),  .bus(rd), .a(ra), .b(rb));
  reg16 r08(.clk(clk), .rst(rst), .en(enRd[8]),  .selA(enRa[8]),  .selB(enRb[8]),  .bus(rd), .a(ra), .b(rb));
  reg16 r09(.clk(clk), .rst(rst), .en(enRd[9]),  .selA(enRa[9]),  .selB(enRb[9]),  .bus(rd), .a(ra), .b(rb));
  reg16 r10(.clk(clk), .rst(rst), .en(enRd[10]), .selA(enRa[10]), .selB(enRb[10]), .bus(rd), .a(ra), .b(rb));
  reg16 r11(.clk(clk), .rst(rst), .en(enRd[11]), .selA(enRa[11]), .selB(enRb[11]), .bus(rd), .a(ra), .b(rb));
  reg16 r12(.clk(clk), .rst(rst), .en(enRd[12]), .selA(enRa[12]), .selB(enRb[12]), .bus(rd), .a(ra), .b(rb));
  reg16 r13(.clk(clk), .rst(rst), .en(enRd[13]), .selA(enRa[13]), .selB(enRb[13]), .bus(rd), .a(ra), .b(rb));
  reg16 r14(.clk(clk), .rst(rst), .en(enRd[14]), .selA(enRa[14]), .selB(enRb[14]), .bus(rd), .a(ra), .b(rb));
  reg16 r15(.clk(clk), .rst(rst), .en(enRd[15]), .selA(enRa[15]), .selB(enRb[15]), .bus(rd), .a(ra), .b(rb));

endmodule

`endif