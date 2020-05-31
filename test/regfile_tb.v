`timescale 1ns/1ns
`include "src/regfile.v"

module regfile_tb;

  reg clk = 1'b0;
  reg rst = 1'b0;
  reg wen = 1'b0;

  reg [3:0]  selRd = 4'b0;
  reg [3:0]  selRa = 4'b0;
  reg [3:0]  selRb = 4'b0;
  reg [15:0] rd    = 16'b0;

  wire [15:0] ra;
  wire [15:0] rb;

  integer testIndex = 0;

  regfile UUT(clk, rst, wen, selRd, selRa, selRb, rd, ra, rb);

  always begin
    clk = ~clk; #10;
  end

  initial begin
    $dumpfile("out/regfile.vcd");
    $dumpvars(0, regfile_tb);

    wen = 1'b1;
    for(testIndex = 0; testIndex < 15; testIndex++) begin
      #45;
      selRd = testIndex;   // increment selected dest. reg
      selRa = testIndex;   // increment selected A register
      selRb = testIndex;
      //selRb = rd; // increment selected B register
      
    end
    
    $finish;
    $display("Testbench completed");
  end

endmodule