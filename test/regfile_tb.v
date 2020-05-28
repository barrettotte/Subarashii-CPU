`timescale 1ns/1ns
`include "src/regfile.v"

module regfile_tb;

  reg clk = 1'b0;
  reg rst = 1'b0;
  reg wen = 1'b0;

  reg [3:0]  selA = 4'b0;
  reg [3:0]  selB = 4'b0;
  reg [3:0]  selR = 4'b0;
  reg [15:0] bus  = 16'b0;

  wire [15:0] a;
  wire [15:0] b;

  integer testIndex = 0;

  regfile UUT(clk, rst, wen, selA, selB, selR, bus, a, b);

  always begin
    clk = ~clk; #10;
  end

  initial begin
    $dumpfile("out/regfile.vcd");
    $dumpvars(0, regfile_tb);

    wen = 1'b1;
    
    

    $finish;
    $display("Testbench completed");
  end

endmodule