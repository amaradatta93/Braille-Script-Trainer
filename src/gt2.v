
module gt2(clk, rst, dec, d, stop);
input clk, rst, dec;
output reg stop;
output reg [3:0]d;
always @(posedge clk)
  begin
    if(rst==0)
      begin
        d<=4'b1001;
        stop<=1'b0;
      end
    else
      begin
        if(dec==1)
          begin
            d<=d-4'b0001;
            if(d==4'h1)
              begin
                stop<=1'b1;
              end
          end
      end
  end
endmodule
