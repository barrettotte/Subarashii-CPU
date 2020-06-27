`timescale 1ns/1ns
`include "src/pc.v"

module pc_tb;

  reg clk = 1'b0;
  reg rst = 1'b0;
  reg en  = 1'b0;
  reg inc = 1'b0;

  reg [15:0] d = 16'b0;

  wire [15:0] o;

  integer testIndex = 0;

  pc UUT(clk, rst, en, inc, d, o);

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("out/pc.vcd");
    $dumpvars(0, pc_tb);

    // reset PC to known state
    rst = 1'b1;
    #10; testIndex++;

    // increment PC as expected    
    rst = 1'b0;
    inc = 1'b1;
    #10; testIndex++;

    // PC should not increment
    inc = 1'b0;
    #10; testIndex++;

    // load value into PC
    en = 1'b1;
    d = 16'b0000000011111111;
    #10; testIndex++;

    // increment normally
    en = 1'b0;
    d = 16'b0;
    inc = 1'b1;
    #10; testIndex++;

    // reset
    rst = 1'b1;
    #10; testIndex++;

    // increment normally
    rst = 1'b0;
    #10; testIndex++;

    $finish;
    $display("Testbench completed");
  end

endmodule