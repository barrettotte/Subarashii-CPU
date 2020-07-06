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
  output tb_pc,     // PC
  output tb_ir,     // Instruction register
  output tb_selRd,  // select Rd
  output tb_selRs,  // select Rs
  output tb_selRt,  // select Rt
  output tb_aluOut  // ALU result

);

wire [15:0] instruction;    // machine code read from ROM
wire [15:0] mdr;            // memory data register

// immediate wires
wire [15:0] immExt;         // immediate extension (sign or zero)
wire [15:0] immExtShift;    // immediate extension, shifted left once
wire [15:0] immExt2c;       // immediate extension (shifted) two's complement

// program counter wires
reg [15:0] pcCur;           // current program counter
wire signed [15:0] pcNext;  // next PC value

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

assign pc2 = pcCur + 16'd2;  // 2 byte instructions

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


// ALU operand selection
assign aluOperandA = (aluSrcA == 2'b00) ? rs                   // Rs
                      : (aluSrcA == 2'b01) ? immExt            // Immediate (extended)
                       : (aluSrcA == 2'b10) ? {rs[15:8], 8'b0} // Rs[HI] (SWP)
                        : 16'b0;                               // Zero

assign aluOperandB = (aluSrcB == 2'b00) ? rt                  // Rt
                      : (aluSrcB == 2'b01) ? immExt           // Immediate (extended)
                       : (aluSrcB == 2'b10) ? {8'b0, rt[7:0]} // Rt[LO] (SWP)
                        : 16'b0;                              // Zero

  // case(aluSrcA)
  //   2'b00: aluOperandA = rs;                       
  //   2'b01: aluOperandA = immExt;                   
  //   2'b10: aluOperandA = {rs[15:8], 8'b0};         
  //   2'b11: aluOperandA = 16'b0;                    
  // endcase
  
  // case(aluSrcB)
  //   2'b00: aluOperandB = rt;                       // Rt
  //   2'b01: aluOperandB = immExt;                   // Immediate (extended)
  //   2'b10: aluOperandB = {8'b0, rs[7:0]};          // Rt[LO] (SWP)
  //   2'b11: aluOperandB = 16'b0;                    // Zero
  // endcase


alu alu( .a(aluOperandA), .b(aluOperandB), .op(aluOp), .fZ(aluStatus[0]), 
  .fC(aluStatus[1]), .fN(aluStatus[2]), .fV(aluStatus[3]), .o(aluResult) );


// Immediate extensions (zero or sign extended)
assign immExt = {((signExt == 1'b1) ? {8{instruction[7]}} : {8{1'b0}}), instruction[7:0]};
assign immExtShift = {immExt[14:0], 1'b0}; // left shift 1 (2 byte instruction)
assign immExt2c = ~(immExtShift) + 1'b1;   // twos complement


// Assign next program counter (handle jump and branch)
always @(*) begin
  // branch enabled and zero flag active
  if((branch & aluStatus[0]) == 1'b1)
    pcCur = (immExtShift[15] == 1'b1) ? (pc2 - immExt2c) : (pc2 + immExtShift);
  else if(jump == 1'b1)
    pcCur = rs;
  else
    pcCur = pc2;
end


ram ram( .clk(clk), .wen(memWrite), .ren(memRead), .din(rt), .addr(aluResult), .dout(mdr) );

// write back to register file
assign rd = (memToReg == 2'b01) ? mdr               // memory to register (LDW)
             : (memToReg == 2'b10) ? pcCur + 16'd2  // store next PC value (JAL)
             : rd;                                  // act as normal

// always @(*) begin
//   case(memToReg)
//     2'b00: rd = rd;            // act normal
//     2'b01: rd = mdr;           // memory to register (LDW)
//     2'b10: rd = pcCur + 16'd2; // store next PC value (JAL)
//     2'b11: rd = rd;            // act normal
//   endcase
// end


// output for testbench
assign tb_pc = pcCur;
assign tb_ir = instruction;

assign tb_aluOut = aluResult;

assign tb_selRd = selRd;
assign tb_selRs = selRs;
assign tb_selRt = selRt;


endmodule

`endif