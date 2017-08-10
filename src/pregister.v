module pregister(I, clk, rst, bpress, Q);
  input [3:0]I;
  input clk, rst, bpress;
  output [3:0]Q;
  reg [3:0]Q;
  always @(posedge clk)
    begin
      if(rst==0)
        begin
          Q<=4'b0000;
        end
      else
        begin
          if(bpress==1)
            begin
              Q<=I;
            end
        end
    end
endmodule      