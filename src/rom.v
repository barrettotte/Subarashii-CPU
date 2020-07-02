/* Read only memory - 256x16 */

`timescale 1ns/1ns

`ifndef _rom
`define _rom

module rom(
  input  clk,         // clock
  input  wen,         // write enable
  input  [15:0] addr, // memory address (PC)
  output [15:0] o     // retrieved data (instruction)
);

reg [15:0] memory [65535:0];

// memory[0] = 16'b0;

assign o = memory[addr];

endmodule

`endif