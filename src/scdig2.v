
module scdig2(clk, rst, dec, d);
input clk, rst, dec;
output reg [3:0]d;
always @(posedge clk)
  begin
    if(rst==0)
      begin
        d<=4'b0000;
      end
    else
      begin
        if(dec==1)
          begin
            d<=d+4'b0001;
          end
      end
  end
endmodule

