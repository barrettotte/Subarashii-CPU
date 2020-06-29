/* Control Unit */

`timescale 1ns/1ns

`ifndef _ctrlunit
`define _ctrlunit

module ctrlunit(
  input clk,           // clock signal
  input rst,           // reset signal
  input [15:0] ir,     // instruction register
  input [3:0] status,  // status register

  output [3:0] selRd,
  output [3:0] selRs,
  output [3:0] selRt,
  output [3:0] aluOp
);



endmodule

`endif