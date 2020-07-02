`timescale 1ns/1ns
`include "src/alu.v"

module alu_tb;

  reg [15:0] a = 16'b0000000000000000;
  reg [15:0] b = 16'b0000000000000000;
  reg [ 2:0] op = 3'b000;

  wire fZ, fC, fN, fE, fV;
  wire [15:0] o;
  
  integer testIndex = 0;

  alu UUT(a, b, op, fZ, fC, fN, fE, fV, o);

  initial begin
    $dumpfile("out/alu.vcd");
    $dumpvars(0, alu_tb);

    // ADD
    a = 16'b0000000000000001;
    b = 16'b0000000000000010;
    op = 3'b000;
    #10; testIndex++;

    // SUB
    a = 16'b0000000000000001;
    b = 16'b0000000000000001;
    op = 3'b001;
    #10; testIndex++;

    // AND
    a = 16'b0000000000000110;
    b = 16'b0000000000000101;
    op = 3'b010;
    #10; testIndex++;

    // ORR
    a = 16'b0000000000000110;
    b = 16'b0000000000000101;
    op = 3'b011;
    #10; testIndex++;

    // NOT
    a = 16'b0000000000001111;
    b = 16'b0000000000000000;
    op = 3'b100;
    #10; testIndex++;

    // XOR
    a = 16'b0000000000000110;
    b = 16'b0000000000000101;
    op = 3'b101;
    #10; testIndex++;

    // LSR
    a = 16'b0000000000000010;
    b = 16'b0000000000000000;
    op = 3'b110;
    #10; testIndex++;

    // LSL
    a = 16'b0000000000000010;
    b = 16'b0000000000000000;
    op = 3'b111;
    #10; testIndex++;

    $finish;
    $display("Testbench completed");
  end

endmodule