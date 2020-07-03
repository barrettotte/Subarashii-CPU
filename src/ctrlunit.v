/* Control Unit */

`timescale 1ns/1ns

`ifndef _ctrlunit
`define _ctrlunit

module ctrlunit(
  input clk,          // clock signal
  input rst,          // reset signal
  input [3:0] opcode, // opcode of instruction

  output reg [2:0] aluOp,    // ALU opcode
  output reg [1:0] regDst    // register destination
  output reg [1:0] memToReg, // register to load with memory
  output reg [1:0] aluSrc1,  // ALU operand 1 source (00=Rs, 01=??,        10=Rs[HI], 11=XX)
  output reg [1:0] aluSrc2,  // ALU operand 2 source (00=Rt, 01=immediate, 10=Rt[LO], 11=XX)
  output reg jump,           // jump
  output reg branch,         // branch
  output reg memRead,        // read from memory
  output reg memWrite,       // write to memory
  output reg regWrite,       // write to register
);

always @(*) begin

  if(rst == 1'b1) begin
    aluOp = 2'b00;
    regDst = 2'b00;
    memToReg = 2'b0;
    aluSrc1 = 2'b0;
    aluSrc2 = 2'b0;
    branch = 1'b0;
    memRead = 1'b0;
    memWrite = 1'b0;
    regWrite = 1'b0;
  end
  else begin
    case(opcode)

      // ADD
      4'b0000: begin
        aluOp = 3'b000;   // ADD op
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // SUB
      4'b0001: begin
        aluOp = 3'b001;   // SUB op
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // AND
      4'b0010: begin
        aluOp = 3'b010;   // AND op
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // ORR
      4'b0011: begin
        aluOp = 3'b011;   // ORR op
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // NOT
      4'b0100: begin
        aluOp = 3'b100;   // NOT op
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // XOR
      4'b0101: begin
        aluOp = 3'b101;   // XOR op
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // LSR
      4'b0110: begin
        aluOp = 3'b110;   // ADD op
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // LSL
      4'b0111: begin
        aluOp = 3'b111;   // ADD op
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // ADI
      4'b1000: begin
        aluOp = 3'b000;   // ADD op
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b01;  // use immediate
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // SWP
      4'b1001: begin
        aluOp = 3'b000;   // Use ADD op to combine bytes
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b10;  // use Rs hi byte
        aluSrc2 = 2'b10;  // use Rt lo byte
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // LDW
      4'b1010: begin
        
      end

      // STW
      4'b1011: begin
        
      end

      // BRZ
      4'b1100: begin
        
      end

      // JMP
      4'b1101: begin
        aluOp = 3'b000;   // ALU won't be used
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b00; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b1;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b0;  // don't write to register file
      end

      // JAL
      4'b1110: begin
        aluOp = 3'b000;   // ALU won't be used
        regDst = 2'b00;   // store result in Rd
        memToReg = 2'b10; // don't put memory in reg
        aluSrc1 = 2'b00;  // use Rs
        aluSrc2 = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b1;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
      end

      // ???
      4'b1111: begin
        
      end
    endcase
  end
end

endmodule

`endif