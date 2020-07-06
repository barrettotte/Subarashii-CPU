/* Random access memory - 256x16 */

`timescale 1ns/1ns

`ifndef _ram
`define _ram

module ram(
  input  clk,         // clock
  input  wen,         // write enable
  input  ren,         // read enable
  input  [15:0] din,  // data to store
  input  [15:0] addr, // memory address
  output [15:0] dout  // retrieved data
);

reg memory [65535:0];

always @(posedge clk) begin
  if(wen) memory[addr] = din;
end

assign dout = (ren) ? memory[addr] : 16'b0;

endmodule

`endif