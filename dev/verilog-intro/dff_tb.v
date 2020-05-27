`timescale 1ns/1ns
`include "src/dff.v"

module dff_tb;

  reg clk = 0, rst = 0, d = 0;
  wire q;

  reg [1:0] testvectors [3:0];
  integer i;

  dff UUT(clk, rst, d, q);

  initial begin
    testvectors[0] = 3'b00;
    testvectors[1] = 3'b01;
    testvectors[2] = 3'b10;
    testvectors[3] = 3'b11;
  end

  always begin
    clk = ~clk; #10;
  end

  initial begin
    $dumpfile("out/dff.vcd");
    $dumpvars(0, dff_tb);
    for(i = 0; i < 4; i++) begin
      {d, rst} = testvectors[i];
      #45;
    end
    $finish;
    $display("Testbench completed");
  end

endmodule