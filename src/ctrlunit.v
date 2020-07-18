/* Control Unit */

`timescale 1ns/1ns

`ifndef _ctrlunit
`define _ctrlunit

module ctrlunit(
  input clk,                 // clock signal
  input rst,                 // reset signal
  input [3:0] opcode,        // opcode of instruction

  output reg [2:0] aluOp,    // ALU opcode
  output reg [1:0] memToReg, // register to load with memory
  output reg [1:0] aluSrcA,  // ALU operand A source (00=Rs, 01=??,        10=Rs[HI], 11=0)
  output reg [1:0] aluSrcB,  // ALU operand B source (00=Rt, 01=immediate, 10=Rt[LO], 11=0)
  output reg jump,           // jump
  output reg branch,         // branch
  output reg memRead,        // read from memory
  output reg memWrite,       // write to memory
  output reg regWrite,       // write to register
  output reg signExt         // sign extend immediate
);

always @(*) begin

  if(rst == 1'b1) begin
    aluOp = 2'b00;
    memToReg = 2'b0;
    aluSrcA = 2'b0;
    aluSrcB = 2'b0;
    branch = 1'b0;
    jump = 1'b0;
    memRead = 1'b0;
    memWrite = 1'b0;
    regWrite = 1'b0;
    signExt  = 1'b0;
  end
  else begin
    case(opcode)

      // ADD
      4'b0000: begin
        aluOp = 3'b000;   // ADD op
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // SUB
      4'b0001: begin
        aluOp = 3'b001;   // SUB op
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // AND
      4'b0010: begin
        aluOp = 3'b010;   // AND op
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // ORR
      4'b0011: begin
        aluOp = 3'b011;   // ORR op
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // NOT
      4'b0100: begin
        aluOp = 3'b100;   // NOT op
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // XOR
      4'b0101: begin
        aluOp = 3'b101;   // XOR op
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // LSR
      4'b0110: begin
        aluOp = 3'b110;   // ADD op
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // LSL
      4'b0111: begin
        aluOp = 3'b111;   // ADD op
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b00;  // use Rt
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // ADI
      4'b1000: begin
        aluOp = 3'b000;   // ADD op
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b01;  // use immediate
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // SWP
      4'b1001: begin
        aluOp = 3'b000;   // Use ADD op to combine bytes
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b10;  // use Rs hi byte
        aluSrcB = 2'b10;  // use Rt lo byte
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write ALU result to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // LDW
      4'b1010: begin
        aluOp = 3'b000;   // Use ADD op to build address
        memToReg = 2'b01; // load memory into Rd
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b11;  // use zero
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b1;   // read from memory
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write memory read to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // STW
      4'b1011: begin
        aluOp = 3'b000;   // Use ADD op to build address
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b11;  // use zero
        branch = 1'b0;    // no branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // don't read from memory
        memWrite = 1'b1;  // write to memory
        regWrite = 1'b0;  // don't write to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // BRZ
      4'b1100: begin
        aluOp = 3'b000;   // Use ADD op to check zero flag
        memToReg = 2'b00; // don't put memory in reg
        aluSrcA = 2'b00;  // use Rs
        aluSrcB = 2'b11;  // use zero
        branch = 1'b1;    // use branching
        jump = 1'b0;      // no jumping
        memRead = 1'b0;   // don't read from memory
        memWrite = 1'b0;  // don't write to memory
        regWrite = 1'b0;  // don't write to Rd
        signExt  = 1'b0;  // no sign extending
      end

      // JAL
      4'b1101: begin
        aluOp = 3'b000;   // ALU won't be used
        memToReg = 2'b10; // link
        aluSrcA = 2'b11;  // use zero
        aluSrcB = 2'b11;  // use zero
        branch = 1'b0;    // no branching
        jump = 1'b1;      // jump
        memRead = 1'b0;   // no memory read
        memWrite = 1'b0;  // no memory write
        regWrite = 1'b1;  // write PC to link register
        signExt  = 1'b0;  // no sign extending
      end

      // ???
      4'b1110: begin
        // TODO: Unused
      end

      // ???
      4'b1111: begin
        // TODO: Unused
      end
    endcase
  end
end

endmodule

`endif