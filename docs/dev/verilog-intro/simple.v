module simple(A, B);
  input  [3:0] A;
  output [3:0] B;

  assign B = { A[0], A[2], A[1], A[3] };

endmodule