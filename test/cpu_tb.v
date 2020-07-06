`timescale 1ns/1ns
`include "src/cpu.v"

module cpu_tb;

  reg clk = 1'b0;
  reg rst = 1'b0;
  wire tb_pc = 16'b0;
  wire tb_ir = 16'b0;
  wire tb_aluOut = 16'b0;
  wire tb_selRd = 4'b0;
  wire tb_selRs = 4'b0;
  wire tb_selRt = 4'b0;

  integer testIndex = 0;

  cpu UUT(clk, rst, tb_pc, tb_ir, tb_aluOut, tb_selRd, tb_selRs, tb_selRt);

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("out/cpu.vcd");
    $dumpvars(0, cpu_tb);
    
    rst = 1'b1;
    #20; testIndex++;

    rst = 1'b0;
    #20; testIndex++;

    #20; testIndex++;
    #20; testIndex++;
    #20; testIndex++;
    #20; testIndex++;

    #20; testIndex++;
    #20; testIndex++;
    #20; testIndex++;
    #20; testIndex++;

    $finish;
    $display("Testbench completed");
  end

endmodule