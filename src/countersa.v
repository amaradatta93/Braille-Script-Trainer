
module countersa(clk, rst, enable, count);
input clk, rst, enable;
output reg [7:0]count;
always @(posedge clk)
  begin
    if(rst==0)
      begin
        count<=8'h0;
      end
    else
      begin
        if(enable==1)
          begin
            count<= count+8'h1;
          end
      end
  end
endmodule
