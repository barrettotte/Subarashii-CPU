/* Program Counter */

`timescale 1ns/1ns

`ifndef _pc
`define _pc

module pc(
  input clk,          // clock
  input rst,          // reset
  input en,           // read enable
  input inc,          // increment pc
  input [15:0] d,     // pc data
  output reg [15:0] o // pc out
);

always @(posedge clk) begin
  if(rst)      o <= 16'b0;
  else if(en)  o <= d;
  else if(inc) o <= o + 1;
  else         o <= o;
end

endmodule

`endif