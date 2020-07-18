/* Read only memory - 256x16 */

`timescale 1ns/1ns

`ifndef _rom
`define _rom

module rom(
  input  [15:0] addr,  // memory address (PC)
  output reg [15:0] o  // retrieved data (instruction)
);

reg [15:0] memory [65535:0];


// ROM contents - 2 byte instruction size
// Just a big "test suite" for each instruction
always @(addr) begin
  case(addr)
    // Test ALU-oriented instructions
    /*16'd00:  o <= 16'b0000_0000_0000_0000; // ADD R0,R0,R0 (NOP)
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
    // Reset R1-R4
    16'd22:  o <= 16'b0101_0001_0001_0001; // XOR R1,R1,R1
    16'd24:  o <= 16'b0101_0010_0010_0010; // XOR R2,R2,R2
    16'd26:  o <= 16'b0101_0011_0011_0011; // XOR R3,R3,R3
    16'd28:  o <= 16'b0101_0100_0100_0100; // XOR R4,R4,R4
    // SWP
    16'd30:  o <= 16'b1000_0001_1100_1100; // ADI R1,11001100
    16'd32:  o <= 16'b1000_0010_1010_1010; // ADI R2,10101010
    16'd34:  o <= 16'b1001_0011_0001_0010; // SWP R3,R1,R2
    // Reset R1-R3
    16'd36:  o <= 16'b0101_0001_0001_0001; // XOR R1,R1,R1
    16'd38:  o <= 16'b0101_0010_0010_0010; // XOR R2,R2,R2
    16'd40:  o <= 16'b0101_0011_0011_0011; // XOR R3,R3,R3
    // Test Memory-oriented instructions
    16'd44:  o <= 16'b1000_0001_0000_0010; // ADI R1,0x02 (val)
    16'd46:  o <= 16'b1000_0010_0000_1000; // ADI R2,0x08 (addr)
    16'd48:  o <= 16'b1011_0000_0010_0001; // STW R0,R2,R1
    16'd50:  o <= 16'b0101_0001_0001_0001; // XOR R1,R1,R1
    16'd52:  o <= 16'b1010_0001_0010_0000; // LDW R1,R2,R0
    16'd54:  o <= 16'b0000_0000_0001_0000; // ADD R0,R1,R0
    */
    // Reset R1-R2
    16'd56:  o <= 16'b0101_0001_0001_0001; // XOR R1,R1,R1
    16'd58:  o <= 16'b0101_0010_0010_0010; // XOR R2,R2,R2
    // Test Branching
    16'd60:  o <= 16'b1000_0001_0000_0011; // ADI R1,0x03  (skip 3 instructions ahead if Z)
    16'd62:  o <= 16'b1100_0001_0000_0000; // BRZ R1,R1,R1 (R1-R1=0 -> always branch)
    16'd64:  o <= 16'b0000_0000_0000_0000; // ADD R0,R0,R0 (should be skipped)
    16'd66:  o <= 16'b0000_0000_0000_0000; // ADD R0,R0,R0 (should be skipped)
    16'd68:  o <= 16'b0000_0000_0000_0000; // ADD R0,R0,R0 (should be skipped)
    16'd70:  o <= 16'b1000_0010_0000_0111; // ADI R2,0x07

    default: o <= 16'b0000_0000_0000_0000; // ADD R0,R0,R0 (NOP)
  endcase
end

endmodule

`endif