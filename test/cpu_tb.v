`timescale 1ns/1ns
`include "src/cpu.v"

module cpu_tb;

  reg clk = 1'b0;
  reg rst = 1'b0;
  wire [15:0] tb_pc;
  wire [15:0] tb_ir;
  wire [15:0] tb_rd;
  wire [15:0] tb_rs;
  wire [15:0] tb_rt;
  wire [3:0]  tb_aluStatus;

  cpu UUT(clk, rst, tb_pc, tb_ir, tb_rd, tb_rs, tb_rt, tb_aluStatus);

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("out/cpu.vcd");
    $dumpvars(0, cpu_tb);
    rst = 1'b1; #20;
    rst = 1'b0; #20;
    #2000; // sit back and run through the ROM
    $finish;
    $display("Testbench completed");
  end

endmodule