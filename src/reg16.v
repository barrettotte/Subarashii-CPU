/* 16-bit register */

`timescale 1ns/1ns

`ifndef _reg16
`define _reg16

module reg16(
  input  clk,         // clock signal
  input  rst,         // reset signal
  input  en,          // enable read from bus
  input  selA,        // enable A
  input  selB,        // enable B
  input  [15:0] bus,  // 16-bit bus input 
  output [15:0] a,   // A selector output
  output [15:0] b    // B selector output
);

  reg [15:0] d;

  always @(posedge clk) begin
    if(rst)     d <= 16'b0;   // reset register data
    else if(en) d <= bus;     // read from bus
    else        d <= d;       // remain the same
  end

  assign a = selA ? d : 16'bz;  // output to A selector or disconnect
  assign b = selB ? d : 16'bz;  // output to B selector or disconnect

endmodule

`endif