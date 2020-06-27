/* Instruction Register */

`timescale 1ns/1ns

`ifndef _ir
`define _ir

module ir(
  input clk,          // clock
  input rst,          // reset
  input en,           // read enable
  input [15:0] d,     // pc data
  output reg [15:0] o // pc out
);

always @(posedge clk) begin
  if(rst)      o <= 16'b0;
  else if(en)  o <= d;
  else         o <= o;
end

endmodule

`endif