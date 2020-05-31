/* 16x16-bit registers */

`timescale 1ns/1ns

`include "dmux4x16.v"
`include "reg16.v"

`ifndef _regfile
`define _regfile

/* example instruction:  
  ADD R0,R1,R2
  Ins  Rd   Ra   Rb
  ???? 0001 0010 0011
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

  dmux4x16 d0(wen,  selRd, enRd);
  dmux4x16 d1(1'b1, selRa, enRa);
  dmux4x16 d2(1'b1, selRb, enRb);

  reg16 r00(clk, rst, enRd[0],  enRa[0],  enRb[0],  rd, ra, rb);
  reg16 r01(clk, rst, enRd[1],  enRa[1],  enRb[1],  rd, ra, rb);
  reg16 r02(clk, rst, enRd[2],  enRa[2],  enRb[2],  rd, ra, rb);
  reg16 r03(clk, rst, enRd[3],  enRa[3],  enRb[3],  rd, ra, rb);
  reg16 r04(clk, rst, enRd[4],  enRa[4],  enRb[4],  rd, ra, rb);
  reg16 r05(clk, rst, enRd[5],  enRa[5],  enRb[5],  rd, ra, rb);
  reg16 r06(clk, rst, enRd[6],  enRa[6],  enRb[6],  rd, ra, rb);
  reg16 r07(clk, rst, enRd[7],  enRa[7],  enRb[7],  rd, ra, rb);
  reg16 r08(clk, rst, enRd[8],  enRa[8],  enRb[8],  rd, ra, rb);
  reg16 r09(clk, rst, enRd[9],  enRa[9],  enRb[9],  rd, ra, rb);
  reg16 r10(clk, rst, enRd[10], enRa[10], enRb[10], rd, ra, rb);
  reg16 r11(clk, rst, enRd[11], enRa[11], enRb[11], rd, ra, rb);
  reg16 r12(clk, rst, enRd[12], enRa[12], enRb[12], rd, ra, rb);
  reg16 r13(clk, rst, enRd[13], enRa[13], enRb[13], rd, ra, rb);
  reg16 r14(clk, rst, enRd[14], enRa[14], enRb[14], rd, ra, rb);
  reg16 r15(clk, rst, enRd[15], enRa[15], enRb[15], rd, ra, rb);

endmodule

`endif