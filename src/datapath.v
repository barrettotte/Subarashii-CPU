/* Datapath (hooking up register file with ALU) */

`timescale 1ns/1ns

`include "regfile.v"
`include "alu.v"

`ifndef _datapath
`define _datapath

module datapath(
  input clk,                // clock signal
  input rst,                // reset signal
  input wen,                // write enable
  input [3:0]  selRd,       // destination
  input [3:0]  selRs,       // first operand
  input [3:0]  selRt,       // second operand
  input [3:0]  aluOp,       // ALU function
  input [15:0] t,           // second operand (reg or imm)
  input selT,               // use reg or imm

  output reg fZ,            // zero flag
  output reg fC,            // carry flag
  output reg fN,            // negative flag
  output reg fV,            // overflow flag

  output [15:0] rout,       // register output
  output [15:0] aout        // ALU output (write to selRd)
);

wire [15:0] rt, op1, op2;

assign op2 = selT ? t : rt; // mux (immediate or register)
assign rout = op1;

regfile(clk, rst, wen, selRd, selRs, selRt, aout, op1, rt);

alu(op1, op2, aluOp, fZ, fC, fN, fV, aluOut);

endmodule

`endif