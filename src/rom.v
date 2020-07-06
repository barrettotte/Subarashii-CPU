/* Read only memory - 256x16 */

`timescale 1ns/1ns

`ifndef _rom
`define _rom

module rom(
  input  [15:0] addr, // memory address (PC)
  output [15:0] o     // retrieved data (instruction)
);

reg memory [65535:0];

assign o = memory[addr];

endmodule

`endif