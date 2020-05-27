`timescale 1ns/1ns
`include "src/dmux4x16.v"

module dmux4x16_tb;

  reg en = 1'b0;
  reg [3:0] sel = 4'b0;
  wire [15:0] d;

  reg [3:0] testvectors [15:0];
  integer i;

  dmux4x16 UUT(en, sel, d);

  initial begin
    testvectors[0]  = 4'b0000; // R0
    testvectors[1]  = 4'b0001; // R1
    testvectors[2]  = 4'b0010; // R2
    testvectors[3]  = 4'b0011; // R3
    testvectors[4]  = 4'b0100; // R4
    testvectors[5]  = 4'b0101; // R5
    testvectors[6]  = 4'b0110; // R6
    testvectors[7]  = 4'b0111; // R7
    testvectors[8]  = 4'b1000; // R8
    testvectors[9]  = 4'b1001; // R9
    testvectors[10] = 4'b1010; // R10
    testvectors[11] = 4'b1011; // R11
    testvectors[12] = 4'b1100; // R12
    testvectors[13] = 4'b1101; // R13
    testvectors[14] = 4'b1110; // R14
    testvectors[15] = 4'b1111; // R15
  end

  initial begin
    $dumpfile("out/dmux4x16.vcd");
    $dumpvars(0, dmux4x16_tb);

    // ensure data is not accessible when enable is off
    sel = testvectors[0];
    #45;
    en = 1'b1;
    
    // test selecting each value
    for(i = 1; i < 16; i++) begin
      sel = testvectors[i];
      #45;
    end

    $finish;
    $display("Testbench completed");
  end

endmodule