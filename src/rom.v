/* Read only memory - 256x16 */

`timescale 1ns/1ns

`ifndef _rom
`define _rom

module rom(
  input  [15:0] addr,  // memory address (PC)
  output reg [15:0] o  // retrieved data (instruction)
);

reg memory [65535:0];


// ROM contents - 2 byte instruction size
always @(addr) begin
  case(addr)
    16'd00:  o <= 16'b0000_0000_0000_0000; // ADD R0,R0,R0 (NOP)
    16'd02:  o <= 16'b1000_0001_0000_0010; // ADI R1,0x02
    16'd04:  o <= 16'b1000_0010_0000_0001; // ADI R2,0x01
    16'd06:  o <= 16'b0000_0011_0010_0001; // ADD R3,R2,R1
    16'd08:  o <= 16'b0001_0011_0011_0000; // SUB R3,R3,R0
    16'd10:  o <= 16'b0010_0010_0010_0011; // AND R2,R2,R3
    16'd12:  o <= 16'b0011_0010_0011_0010; // ORR R2,R3,R2
    16'd14:  o <= 16'b0100_0100_0100_0000; // NOT R4,R4,R0
    16'd16:  o <= 16'b0101_0100_0100_0100; // XOR R4,R4,R4 (CLR)
    16'd18:  o <= 16'b0110_0010_0010_0000; // LSR R2,R2,R0
    16'd20:  o <= 16'b0111_0010_0010_0000; // LSL R2,R2,R0

    default: o <= 16'b0000_0000_0000_0000; // ADD R0,R0,R0 (NOP)
  endcase
end

endmodule

`endif