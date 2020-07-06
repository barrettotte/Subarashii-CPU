/* Central Processing Unit */

`timescale 1ns/1ns

`ifndef _cpu
`define _cpu

`include "alu.v"
`include "ctrlunit.v"
`include "pc.v"
`include "regfile.v"
`include "ram.v"
`include "rom.v"


module cpu(
  input clk,            // clock signal
  input rst,            // reset signal
  output [15:0] pcOut,  // program counter
  output [15:0] result  // ALU result
);

wire [15:0] instruction;    // machine code read from ROM
wire [15:0] mdr;            // memory data register

// program counter wires
reg [15:0] pcCur;           // current program counter
wire signed [15:0] pcNext;  // next PC value
wire pcInc;                 // enable PC increment
wire pcRead;                // enable PC update

// control unit wires
wire [2:0] aluOp;
wire [1:0] regDst, memToReg, aluSrcA, aluSrcB;
wire jump, branch, memRead, memWrite, regWrite;

// reg file wires
wire [2:0] selRd, selRs, selRt;
wire [15:0] rd, rs, rt;

// ALU wires
wire [15:0] aluOperandA, aluOperandB;
wire [15:0] aluResult;
wire [3:0]  aluStatus;


pc pc( .clk(clk), .rst(rst), .en(pcRead), .inc(pcInc), .d(pcNext), .o(pcCur) );

rom rom( .addr(pcCur), .o(instruction) );

ctrlunit ctrlunit( .rst(rst), .opcode(instruction[15:12]), .aluOp(aluOp), 
  .regDst(regDst), .memToReg(memToReg), .aluSrcA(aluSrcA),
  .aluSrcB(aluSrcB), .jump(jump), .branch(branch), 
  .memRead(memRead), .memWrite(memWrite), .regWrite(regWrite) );


// register selection
always @(*) begin
  case(regDst)
    2'b00: selRd = instruction[11:8]; //
    2'b01: selRd = instruction[11:8]; //
    2'b10: selRd = 4'b1110;           // link (JAL)
    2'b11: selRd = instruction[11:8]; //
  endcase

  selRs = instruction[7:4];
  selRt = instruction[3:0];
end

regfile regfile( .clk(clk), .rst(rst), .wen(regWrite), .selRd(selRd),
  .selRs(selRs), .selRt(selRt), .rd(rd), .rs(rs), .rt(rt) );


// ALU operand selection
always @(*) begin
  case(aluSrcA)
    2'b00: aluOperandA = rs;                       // Rs
    2'b01: aluOperandA = {8'b0, instruction[7:0]}; // Immediate
    2'b10: aluOperandA = {rs[15:8], 8'b0};         // Rs[HI] (SWP)
    2'b11: aluOperandA = 16'b0;                    // Zero
  endcase
  
  case(aluSrcB)
    2'b00: aluOperandB = rt;                       // Rt
    2'b01: aluOperandB = {8'b0, instruction[7:0]}; // Immediate
    2'b10: aluOperandB = {8'b0, rs[7:0]};          // Rt[LO] (SWP)
    2'b11: aluOperandB = 16'b0;                    // Zero
  endcase
end

alu alu( .a(aluOperandA), .b(aluOperandB), .op(aluOp), .fZ(aluStatus[0]), 
  .fC(aluStatus[1]), .fN(aluStatus[2]), .fV(aluStatus[3]), .o(aluResult) );

// TODO: jump
// TODO: branch

// Assign next program counter (handle jump and branch)
always @(*) begin
  // branch enabled and zero flag active
  if(branch and aluStatus[0]) begin
    pcCur = 
  else
    pcCur = 
  end
end


ram ram( .clk(clk), .wen(memWrite), .ren(memRead), .din(rt), .addr(aluOut), .dout(mdr) );

// write back to register file
always @(*) begin
  case(memToReg)
    2'b00: rd = rd;            // act normal
    2'b01: rd = rt;            // memory to register (LDW)
    2'b10: rd = pcCur + 16'd2; // store next PC value (JAL)
    2'b11: rd = rd;            // act normal
  endcase
end

assign pcOut = pcCur;
assign result = aluResult;

endmodule

`endif