`timescale 1ns/1ns
`include "src/alu.v"

module alu_tb;

  reg [15:0] rs = 16'b0000000000000000;
  reg [15:0] rt = 16'b0000000000000000;
  reg [ 2:0] op = 3'b000;

  wire fZ, fC, fN, fP;
  wire [15:0] rd;
  
  integer testIndex = 0;

  alu UUT(rs, rt, op, fZ, fC, fN, fP, rd);

  initial begin
    $dumpfile("out/alu.vcd");
    $dumpvars(0, alu_tb);

    // ADD
    rs = 16'b0000000000000001;
    rt = 16'b0000000000000010;
    op = 3'b000;
    #10; testIndex++;

    // SUB
    rs = 16'b0000000000000001;
    rt = 16'b0000000000000001;
    op = 3'b001;
    #10; testIndex++;

    // AND
    rs = 16'b0000000000000110;
    rt = 16'b0000000000000101;
    op = 3'b010;
    #10; testIndex++;

    // ORR
    rs = 16'b0000000000000110;
    rt = 16'b0000000000000101;
    op = 3'b011;
    #10; testIndex++;

    // NOT
    rs = 16'b0000000000001111;
    rt = 16'b0000000000000000;
    op = 3'b100;
    #10; testIndex++;

    // XOR
    rs = 16'b0000000000000110;
    rt = 16'b0000000000000101;
    op = 3'b101;
    #10; testIndex++;

    // LSR
    rs = 16'b0000000000000010;
    rt = 16'b0000000000000000;
    op = 3'b110;
    #10; testIndex++;

    // LSL
    rs = 16'b0000000000000010;
    rt = 16'b0000000000000000;
    op = 3'b111;
    #10; testIndex++;

    $finish;
    $display("Testbench completed");
  end

endmodule