/* Central Processing Unit */

`timescale 1ns/1ns

`ifndef _cpu
`define _cpu

`include "alu.v"
`include "ctrlunit.v"
`include "regfile.v"
`include "ram.v"
`include "rom.v"


module cpu(
  input clk,                // clock signal
  input rst,                // reset signal

  // output ports for testbenches
  output [15:0] tb_pc,
  output [15:0] tb_pcn,
  output [15:0] tb_pc2,
  output [15:0] tb_ir,

  output [3:0] tb_selRd,
  output [3:0] tb_selRs,
  output [3:0] tb_selRt,

  output [15:0] tb_rd,
  output [15:0] tb_rs,
  output [15:0] tb_rt,

  output [15:0] tb_aluOut,
  output [15:0] tb_aluOperandA,
  output [15:0] tb_aluOperandB,
  output [3:0]  tb_aluStatus,

  output [2:0] tb_ctrl_aluOp, 
  output [1:0] tb_ctrl_regDst, 
  output [1:0] tb_ctrl_memToReg, 
  output [1:0] tb_ctrl_aluSrcA,
  output [1:0] tb_ctrl_aluSrcB, 
  output tb_ctrl_jump, 
  output tb_ctrl_branch, 
  output tb_ctrl_memRead, 
  output tb_ctrl_memWrite, 
  output tb_ctrl_regWrite, 
  output tb_ctrl_signExt

);

wire [15:0] instruction;     // machine code read from ROM
wire [15:0] mdr;             // memory data register

// immediate wires
wire [15:0] immExt;          // immediate extension (sign or zero)
wire signed [15:0] immShift; // immediate extension, shifted left once
wire [15:0] immExt2c;        // immediate extension (shifted) two's complement

// program counter wires
reg [15:0] pcCur;            // current program counter
wire [15:0] pcNext;          // next PC value
wire [15:0] pc2;             // PC next instruction (2 byte instructions)

// control unit wires
wire [2:0] aluOp;
wire [1:0] regDst, memToReg, aluSrcA, aluSrcB;
wire jump, branch, memRead, memWrite, regWrite, signExt;

// reg file wires
wire [3:0] selRd, selRs, selRt;
wire [15:0] rd, rs, rt;

// ALU wires
wire [15:0] aluOperandA, aluOperandB; // muxed inputs
wire [15:0] aluResult;
wire [3:0]  aluStatus;


// Program counter
always @(posedge clk or posedge rst) begin
  if(rst)
    pcCur <= 16'b0;
  else
    pcCur <= pcNext;
end

rom rom( .addr(pcCur), .o(instruction) );

ctrlunit ctrlunit( .clk(clk), .rst(rst), .opcode(instruction[15:12]), .aluOp(aluOp), 
  .regDst(regDst), .memToReg(memToReg), .aluSrcA(aluSrcA),
  .aluSrcB(aluSrcB), .jump(jump), .branch(branch), .memRead(memRead), 
  .memWrite(memWrite), .regWrite(regWrite), .signExt(signExt) );


// register selection
assign selRd = instruction[11:8];
assign selRs = instruction[7:4];
assign selRt = instruction[3:0];


regfile regfile( .clk(clk), .rst(rst), .wen(regWrite), .selRd(selRd),
  .selRs(selRs), .selRt(selRt), .rd(rd), .rs(rs), .rt(rt) );


// ALU operand selection (muxed ALU inputs)
assign aluOperandA = (aluSrcA == 2'b00) ? rs                   // Rs
                      : (aluSrcA == 2'b01) ? immExt            // Immediate (extended)
                       : (aluSrcA == 2'b10) ? {rs[15:8], 8'b0} // Rs[HI] (SWP)
                        : 16'b0;                               // Zero

assign aluOperandB = (aluSrcB == 2'b00) ? rt                   // Rt
                      : (aluSrcB == 2'b01) ? immExt            // Immediate (extended)
                       : (aluSrcB == 2'b10) ? {8'b0, rt[7:0]}  // Rt[LO] (SWP)
                        : 16'b0;                               // Zero


alu alu( .a(aluOperandA), .b(aluOperandB), .op(aluOp), .fZ(aluStatus[0]), 
  .fC(aluStatus[1]), .fN(aluStatus[2]), .fV(aluStatus[3]), .o(aluResult) );


// Immediate extensions (zero or sign extended)
assign immExt = {((signExt == 1'b1) ? {8{instruction[7]}} : {8{1'b0}}), instruction[7:0]};
assign immShift = {immExt[14:0], 1'b0}; // left shift 1 (2 byte instruction)
assign immExt2c = ~(immShift) + 1'b1;   // twos complement


// Assign next program counter (handle jump and branch)
assign pc2 = pcCur + 16'd2;  // 2 byte instructions
assign pcBrz = (immShift[15] == 1'b1) ? (pc2 - immExt2c) : (pc2 + immShift);
assign pcNext = ((branch & aluStatus[0]) == 1'b1) ? pcBrz  // branch to relative address
                 : (jump == 1'b1) ? rs                     // jump to absolute address
                  : pc2;                                   // just do next instruction


ram ram( .clk(clk), .wen(memWrite), .ren(memRead), .din(rt), .addr(aluResult), .dout(mdr) );

// write back to register file
assign rd = (memToReg == 2'b01) ? mdr               // memory to register (LDW)
             : (memToReg == 2'b10) ? pcCur + 16'd2  // store next PC value (JAL)
             : aluResult;                           // act as normal




// output for testbenches
assign tb_pc = pcCur;
assign tb_pcn = pcNext;
assign tb_pc2 = pc2;
assign tb_ir = instruction;

assign tb_selRd = selRd;
assign tb_selRs = selRs;
assign tb_selRt = selRt;

assign tb_rd = rd;
assign tb_rs = rs;
assign tb_rt = rt;

assign tb_aluOut = aluResult;
assign tb_aluOperandA = aluOperandA;
assign tb_aluOperandB = aluOperandB;
assign tb_aluStatus = aluStatus;

assign tb_ctrl_aluOp = aluOp;
assign tb_ctrl_regDst = regDst;
assign tb_ctrl_memToReg = memToReg;
assign tb_ctrl_aluSrcA = aluSrcA;
assign tb_ctrl_aluSrcB = aluSrcB;
assign tb_ctrl_jump = jump;
assign tb_ctrl_branch = branch;
assign tb_ctrl_memRead = memRead;
assign tb_ctrl_memWrite = memWrite;
assign tb_ctrl_regWrite = regWrite;
assign tb_ctrl_signExt = signExt;


endmodule

`endif