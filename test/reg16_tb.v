`timescale 1ns/1ns
`include "src/reg16.v"

module reg16_tb;

  reg clk  = 1'b0;
  reg rst  = 1'b0;
  reg en   = 1'b0;
  reg selA = 1'b0;
  reg selB = 1'b0;

  reg [15:0] bus = 16'b0;

  wire [15:0] a;
  wire [15:0] b;

  integer testIndex = 0;

  reg16 UUT(clk, rst, en, selA, selB, bus, a, b);

  always begin
    clk = ~clk; #10;
  end

  initial begin
    $dumpfile("out/reg16.vcd");
    $dumpvars(0, reg16_tb);
    
    en = 1'b1;
    bus = 16'b1111000011110000;
    
    selA = 1'b1;
    #45; 
    testIndex++; // assert a == bus

    selA = 1'b0;
    selB = 1'b1;
    #45; 
    testIndex++; // assert b == bus

    en = 1'b0;
    bus = 16'b1100110011001100;
    #45; 
    testIndex++; // assert b == 16'b1111000011110000

    rst = 1'b1;
    selB = 1'b0;
    #45; 
    testIndex++; // assert b == 16'b0

    rst = 1'b0;
    selB = 1'b1;
    en = 1'b1;
    #45; 
    testIndex++; // assert b == 16'b1100110011001100

    $finish;
    $display("Testbench completed");
  end

endmodule