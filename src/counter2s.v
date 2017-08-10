
module counter2s(timeout1s, clk, rst, timeout2s);
input clk, rst, timeout1s;
output reg timeout2s;
reg [1:0]count;
always @(posedge clk)
  begin
    if(rst==0)
      begin
        count<=2'h0;
        timeout2s<=1'b0;
      end
    else
      begin
        timeout2s<=1'b0;
        if(timeout1s==1)
          begin
            count<=count+2'h1;
            if(count==2'h1)
              begin
                timeout2s<=1'b1;
                count<=2'h0;
              end
            else
              begin
                timeout2s<=1'b0;
              end
          end
      end
  end
endmodule


