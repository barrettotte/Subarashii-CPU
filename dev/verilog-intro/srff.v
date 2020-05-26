module srff(
  input wire s,
  input wire r,
  input wire clk,
  input wire rst,
  output reg q
);

  always @(posedge clk) begin
    if(rst) begin
      q <= 1'b0;
    end
    else begin
      case((s,r))
        2'b00:   q <= q;
        2'b01:   q <= 1'b0;
        2'b10:   q <= 1'b1;
        default: q <= 1'bx; // undefined
      endcase
    end
  end
  
endmodule