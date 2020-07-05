/* Arithmetic Logic Unit (ALU) */

`timescale 1ns/1ns

`ifndef _alu
`define _alu

module alu(
  input [15:0] a,      // operand A
  input [15:0] b,      // operand B
  input  [2:0] op,     // ALU operation

  output reg fZ,       // zero flag
  output reg fC,       // carry flag
  output reg fN,       // negative flag
  output reg fV,       // overflow flag

  output reg [15:0] o  // ALU operation result
);

assign fZ = (o == 16'b0);
assign fN = o[15];
assign fE = (o[0] == 1'b0) ? 1'b1 : 1'b0; // even : odd

always @(*) begin
  case(op)
    
    // ADD
    3'b000: begin
      {fC, o} = a + b;
      // operands same sign, result different sign
      fV = (~(a[15] ^ b[15])) & (a[15] ^ o[15]);
    end
    
    // SUB
    3'b001: begin
      {fC, o} = a - b;
      // operands different sign, result same sign as operand 2
      fV = (a[15] ^ b[15]) & (~(b[15] ^ o[15]));
    end

    // AND
    3'b010: begin
      o = a & b;
      fC = 1'b0;
      fV = 1'b0;
    end

    // ORR
    3'b011: begin 
      o = a | b;
      fC = 1'b0;
      fV = 1'b0;
    end

    // NOT
    3'b100: begin  
      o = ~a;
      fC = 1'b0;
      fV = 1'b0;
    end

    // XOR
    3'b101: begin 
      o = a ^ b;
      fC = 1'b0;
      fV = 1'b0;
    end

    // LSR
    3'b110: begin 
      o = a >> (16'b1 & b);
      fC = 1'b0;
      fV = 1'b0;
    end

    // LSL
    3'b111: begin 
      o = a << (16'b1 & b);
      fC = 1'b0;
      fV = 1'b0;
    end

    // ADD
    default: begin
      {fC, o} = a + b;
      fV = (~(a[15] ^ b[15])) & (a[15] ^ o[15]);
    end

  endcase

end

endmodule

`endif