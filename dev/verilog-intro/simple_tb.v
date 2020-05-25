`timescale 1ns/1ns
`include "src/simple.v"

module simple_tb;
  reg [3:0] A = 4'b1010;
  wire [3:0] B;

  initial begin
    $dumpfile("out/simple.vcd");
    $dumpvars(0, s);
    $monitor("A is %b, B is %b.", A, B);

    #50 A = 4'b1100;
    #100 A = 4'b0000;
    #50 $finish;

    $display("Test complete");
  end

  simple s(A, B);
  
endmodule