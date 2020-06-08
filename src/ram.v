/* Random access memory - 256x16 */

`timescale 1ns/1ns

`ifndef _ram
`define _ram

// 16-bit address line
// 0-65535 address range
// 16-bit word
// 16^2 * 256

module ram(
  input clk,         // clock
  input wen,         // write enable
  input addr [15:0], // memory address

);


endmodule

`endif