/* Read only memory - 256x16 */

`timescale 1ns/1ns

`ifndef _rom
`define _rom

module rom(
  input  [15:0] addr,  // memory address (PC)
  output reg [15:0] o  // retrieved data (instruction)
);

reg memory [65535:0];

// fake ROM
always @(addr) begin
  case(addr)
    16'b0:   o <= 16'b1000_0001_00000010; // ADD R1,0x02
    default: o <= 16'b0;
  endcase
end

endmodule

`endif