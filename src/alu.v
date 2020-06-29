/* Arithmetic Logic Unit (ALU) */

`timescale 1ns/1ns

`ifndef _alu
`define _alu

module alu(
  input [15:0] rs,     // register Rs
  input [15:0] rt,     // register Rt
  input  [3:0] op,     // ALU operation

  output reg fZ,        // zero flag
  output reg fC,        // carry flag
  output reg fN,        // negative flag
  output reg fP,        // parity flag
  // output reg fV,     // overflow flag TODO:
  output reg [15:0] y   // ALU operation result
);



always @(rs or rt or op) begin
  case(op)
    4'b0000:  {fC, y} = rs + rt;                  // ADD
    4'b0001:  {fC, y} = rs - rt;                  // SUB
    4'b0010:  {fC, y} = {1'b0, rs & rt};          // AND
    4'b0011:  {fC, y} = {1'b0, rs | rt};          // ORR
    4'b0100:  {fC, y} = {1'b0, ~rs};              // NOT
    4'b0101:  {fC, y} = {1'b0, rs ^ rt};          // XOR
    4'b0110:  begin fC = rs[0];  y = rs >> 1; end // LSR
    4'b0111:  begin fC = rs[15]; y = rs << 1; end // LSL
    default: {fC, y} = {1'b0, rt};                // output Rt
  endcase

  fZ = (y == 16'b0) ? 1'b1 : 1'b0;
  fN = y[15];
  fP = (y[0] == 1'b0) ? 1'b1 : 1'b0; // even : odd
  // fV = 1'b0; // TODO: overflow?

end

endmodule

`endif