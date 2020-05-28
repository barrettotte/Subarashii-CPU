/* 16x16-bit registers */

`timescale 1ns/1ns

`include "dmux4x16.v"
`include "reg16.v"

`ifndef _regfile
`define _regfile

module regfile(
  input  clk,          // clock signal
  input  rst,          // reset signal
  input  wen,          // write enable
  input  [3:0]  selA,  // A selector
  input  [3:0]  selB,  // B selector
  input  [3:0]  selR,  // read selector
  input  [15:0] bus,   // 16-bit bus value
  output [15:0] a,     // A selection
  output [15:0] b      // B selection
);

  wire [15:0] reg_en;  // register read enable
  wire [15:0] wenA;    // write enable for A selection
  wire [15:0] wenB;    // write enable for B selection

  dmux4x16 d0(wen,  selR, reg_en);
  dmux4x16 d1(1'b1, selA, wenA);
  dmux4x16 d2(1'b1, selB, wenB);

  reg16 r00(clk, rst, reg_en[0],  bus, wenA[0],  wenB[0],  a, b);
  reg16 r01(clk, rst, reg_en[1],  bus, wenA[1],  wenB[1],  a, b);
  reg16 r02(clk, rst, reg_en[2],  bus, wenA[2],  wenB[2],  a, b);
  reg16 r03(clk, rst, reg_en[3],  bus, wenA[3],  wenB[3],  a, b);
  reg16 r04(clk, rst, reg_en[4],  bus, wenA[4],  wenB[4],  a, b);
  reg16 r05(clk, rst, reg_en[5],  bus, wenA[5],  wenB[5],  a, b);
  reg16 r06(clk, rst, reg_en[6],  bus, wenA[6],  wenB[6],  a, b);
  reg16 r07(clk, rst, reg_en[7],  bus, wenA[7],  wenB[7],  a, b);
  reg16 r08(clk, rst, reg_en[8],  bus, wenA[8],  wenB[8],  a, b);
  reg16 r09(clk, rst, reg_en[9],  bus, wenA[9],  wenB[9],  a, b);
  reg16 r10(clk, rst, reg_en[10], bus, wenA[10], wenB[10], a, b);
  reg16 r11(clk, rst, reg_en[11], bus, wenA[11], wenB[11], a, b);
  reg16 r12(clk, rst, reg_en[12], bus, wenA[12], wenB[12], a, b);
  reg16 r13(clk, rst, reg_en[13], bus, wenA[13], wenB[13], a, b);
  reg16 r14(clk, rst, reg_en[14], bus, wenA[14], wenB[14], a, b);
  reg16 r15(clk, rst, reg_en[15], bus, wenA[15], wenB[15], a, b);

endmodule

`endif