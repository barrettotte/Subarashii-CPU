`timescale 1ns/1ns
`include "src/ir.v"

module ir_tb;

  reg clk = 1'b0;
  reg rst = 1'b0;
  reg en  = 1'b0;
  reg [15:0] d = 16'b0;

  wire [15:0] o;

  integer testIndex = 0;

  ir UUT(clk, rst, en, d, o);

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("out/ir.vcd");
    $dumpvars(0, ir_tb);

    // reset IR to known state
    rst = 1'b1;
    #10; testIndex++;

    // load value into IR
    en = 1'b1;
    d = 16'b0000000011111111;
    #10; testIndex++;

    // reset
    en = 1'b0;
    rst = 1'b1;
    d = 16'b0;
    #10; testIndex++;

    $finish;
    $display("Testbench completed");
  end

endmodule