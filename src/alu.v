/* Arithmetic Logic Unit (ALU) */

`timescale 1ns/1ns

`ifndef _alu
`define _alu

module alu(
  input  [15:0] rs,     // register Rs
  input  [15:0] rt,     // register Rt
  input   [2:0] op,     // ALU operation

  output reg fN,        // negative flag
  output reg fZ,        // zero flag
  output reg fC,        // carry flag
  output reg fP,        // parity flag
                        // TODO: overflow flag?
  output reg [15:0] rd  // register Rd
);

always @(rs or rt or op) begin
  case(op)
    4'b000:  {fC, rd} = rs + rt;                  // ADD
    4'b001:  {fC, rd} = rs - rt;                  // SUB
    4'b010:  {fC, rd} = {1'b0, rs & rt};          // AND
    4'b011:  {fC, rd} = {1'b0, rs | rt};          // ORR
    4'b100:  {fC, rd} = {1'b0, ~rs};              // NOT
    4'b101:  {fC, rd} = {1'b0, rs ^ rt};          // XOR
    4'b110:  begin fC = rs[0]; rd = rs >> 1; end  // LSR
    4'b111:  begin fC = rs[15]; rd = rs << 1; end // LSL
    default: {fC, rd} = {1'b0, rs};               //
  endcase

  fN = rd[15];
  fZ = (rd == 16'b0)   ? 1'b1 : 1'b0; // 
  fP = (rd[0] == 1'b0) ? 1'b1 : 1'b0; // even : odd

  // fV = 1'b0; // TODO: overflow?
end

endmodule

`endif