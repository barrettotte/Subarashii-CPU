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
  input clk,                    // clock signal
  input rst,                    // reset signal
  // output ports for testbench
  output [15:0] tb_pc,          // program counter
  output [15:0] tb_ir,          // instruction register
  output [15:0] tb_rd,          // Rd value
  output [15:0] tb_rs,          // Rs value
  output [15:0] tb_rt,          // Rt value
  output [3:0]  tb_aluStatus    // ALU status flags
);

wire [15:0] instruction;     // machine code read from ROM
wire [15:0] ramOut;          // value read from RAM
wire signed [15:0] rtShift;  // shifted rt (relative branching)
wire [15:0] immExt;          // immediate extension (sign or zero)

// program counter wires
reg [15:0] pcCur;            // current program counter
wire [15:0] pcNext;          // next PC value
wire [15:0] pc2;             // PC next instruction (2 byte instructions)
wire [15:0] pcBrz;           // PC value for BRZ

// control unit wires
wire [2:0] aluOp;
wire [1:0] memToReg, aluSrcA, aluSrcB;
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
  .memToReg(memToReg), .aluSrcA(aluSrcA), .aluSrcB(aluSrcB), .jump(jump), .branch(branch), 
  .memRead(memRead), .memWrite(memWrite), .regWrite(regWrite), .signExt(signExt) );


// register selection
assign selRd = instruction[11:8];
assign selRs = (instruction[15:12] == 4'b1000) ? instruction[11:8] : instruction[7:4];
assign selRt = instruction[3:0];


regfile regfile( .clk(clk), .rst(rst), .wen(regWrite), .selRd(selRd),
  .selRs(selRs), .selRt(selRt), .rd(rd), .rs(rs), .rt(rt) );


// ALU operand selection (muxed ALU inputs)
assign aluOperandA = (aluSrcA == 2'b00) ? rs                   // Rs
                      : (aluSrcA == 2'b01) ? immExt            // Immediate (extended)
                       : (aluSrcA == 2'b10) ? {rs[7:0], 8'b0}  // Rs[LO] (SWP)
                        : 16'b0;                               // Zero

assign aluOperandB = (aluSrcB == 2'b00) ? rt                   // Rt
                      : (aluSrcB == 2'b01) ? immExt            // Immediate (extended)
                       : (aluSrcB == 2'b10) ? {8'b0, rt[7:0]}  // Rt[LO] (SWP)
                        : 16'b0;                               // Zero


alu alu( .a(aluOperandA), .b(aluOperandB), .op(aluOp), .fZ(aluStatus[0]), 
  .fC(aluStatus[1]), .fN(aluStatus[2]), .fV(aluStatus[3]), .o(aluResult) );


// Immediate extensions (zero or sign extended) -> not used right now...but I think I'll need it?
assign immExt = {((signExt == 1'b1) ? {8{instruction[7]}} : {8{1'b0}}), instruction[7:0]};


// Assign next program counter (handle jump and branch)
assign rtShift = {rt[14:0], 1'b0};                           // left shift 1 (2 byte instruction)
assign pc2 = pcCur + 16'd2;                                  // 2 byte instruction
assign pcBrz = (rtShift[15] == 1'b1) ? (pc2 - (~(rtShift) + 1'b1)) : (pc2 + rtShift);
assign pcNext = ((branch & aluStatus[0]) == 1'b1) ? pcBrz    // branch to relative address if Z
                : (jump == 1'b1) ? rs                        // jump to absolute address
                  : pc2;                                     // just to next instruction


ram ram( .clk(clk), .wen(memWrite), .ren(memRead), .din(rt), .addr(aluResult), .dout(ramOut) );

// write back to register file
assign rd = (regWrite == 1'b0) ? rd                  // do not write new value to rd
            : (memToReg == 2'b01) ? ramOut           // memory to register (LDW)
              : (memToReg == 2'b10) ? pcCur + 16'd2  // store next PC value (JAL)
                : aluResult;                         // act as normal


// output for testbench
assign tb_pc = pcCur;
assign tb_ir = instruction;
assign tb_rd = rd;
assign tb_rs = rs;
assign tb_rt = rt;
assign tb_aluStatus = aluStatus;

endmodule

`endif