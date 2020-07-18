`timescale 1ns/1ns
`include "src/cpu.v"

module cpu_tb;

  reg clk = 1'b0;
  reg rst = 1'b0;
  wire [15:0] tb_pc;
  wire [15:0] tb_pcn;
  wire [15:0] tb_pc2;
  wire [15:0] tb_pcbrz;
  wire [15:0] tb_rtshift;
  wire [15:0] tb_ir;

  wire [3:0]  tb_selRd;
  wire [3:0]  tb_selRs;
  wire [3:0]  tb_selRt;

  wire [15:0] tb_rd;
  wire [15:0] tb_rs;
  wire [15:0] tb_rt;

  wire [15:0] tb_aluOut;
  wire [15:0] tb_aluOperandA;
  wire [15:0] tb_aluOperandB;
  wire [3:0]  tb_aluStatus;

  wire [2:0] tb_ctrl_aluOp;
  wire [1:0] tb_ctrl_regDst;
  wire [1:0] tb_ctrl_memToReg;
  wire [1:0] tb_ctrl_aluSrcA;
  wire [1:0] tb_ctrl_aluSrcB;
  wire tb_ctrl_jump;
  wire tb_ctrl_branch;
  wire tb_ctrl_memRead;
  wire tb_ctrl_memWrite;
  wire tb_ctrl_regWrite;
  wire tb_ctrl_signExt;

  cpu UUT(
    clk, rst, 
    tb_pc, tb_pcn, tb_pc2, tb_pcbrz, tb_rtshift, tb_ir, 
    tb_selRd, tb_selRs, tb_selRt,
    tb_rd, tb_rs, tb_rt,
    tb_aluOut, tb_aluOperandA, tb_aluOperandB, tb_aluStatus,
    
    tb_ctrl_aluOp, tb_ctrl_regDst, tb_ctrl_memToReg, tb_ctrl_aluSrcA, 
    tb_ctrl_aluSrcB, tb_ctrl_jump, tb_ctrl_branch, tb_ctrl_memRead, 
    tb_ctrl_memWrite, tb_ctrl_regWrite, tb_ctrl_signExt
  );

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("out/cpu.vcd");
    $dumpvars(0, cpu_tb);
    rst = 1'b1; #20;
    rst = 1'b0; #20;
    #1500; // sit back and run through the ROM
    $finish;
    $display("Testbench completed");
  end

endmodule