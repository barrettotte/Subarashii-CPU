`timescale 1ns/1ns
`include "src/dflipflop.v"

module testbench;

  reg D = 0, CLK = 0;
  wire Q;

  flipflop UUT(D, CLK, Q);

  always begin
    CLK = ~CLK;
    #10;
  end

  initial begin
    $dumpfile("out/dflipflop.vcd");
    $dumpvars(0, testbench);
    D = 0; #45
    D = 1; #45;
    D = 0; #45;
    $finish;
    $display("Testbench completed");
  end

endmodule