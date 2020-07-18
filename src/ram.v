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

reg [15:0] memory [65535:0];
integer i;

// Clear RAM contents on start
initial begin
  for(i = 0; i < 65535; i++) begin
    memory[i] <= 16'b0;
  end
end

always @(posedge clk) begin
  if(wen) begin 
    memory[addr] = din;
  end
end

assign dout = (ren) ? memory[addr] : 16'b0;

endmodule

`endif