`timescale 1ns/1ns
`include "src/ram.v"

module ram_tb;

  reg clk  = 1'b0;
  reg wen  = 1'b0;
  reg ren  = 1'b0;

  reg [15:0] din = 16'b0;
  reg [15:0] addr = 16'b0;

  wire [15:0] dout;

  integer testIndex = 0;

  ram UUT(clk, wen, ren, din, addr, dout);

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("out/ram.vcd");
    $dumpvars(0, ram_tb);
    
    din = 16'b0000000011111111;
    #10;

    wen = 1'b1;
    testIndex++;
    #10;
    
    wen = 1'b0;
    din = 16'b0000000000000001;
    addr++;
    testIndex++;
    #10;

    wen = 1'b1;
    testIndex++;
    #10;

    wen = 1'b0;
    testIndex++;
    #10;

    addr--;
    testIndex++;
    #10;

    addr--;
    testIndex++;
    #10;


    $finish;
    $display("Testbench completed");
  end

endmodule