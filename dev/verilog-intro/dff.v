/* D Flip Flop */

`timescale 1ns/1ns

`ifndef _dff
`define _dff

module dff(
  input  wire clk,
  input  wire rst,
  input  wire d,
  output reg q
);

  always @(posedge clk) begin
    if(rst) q <= 1'b0;
    else    q <= d;
  end
  
endmodule

`endif