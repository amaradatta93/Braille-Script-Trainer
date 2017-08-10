// ECE6370
// Author: Sindhoora Surapaneni, 0233
// counter100ms
// this module gives 100ms 
module counter100ms(timeout1ms, clk, rst, timeout100ms);
input clk, rst, timeout1ms;
output reg timeout100ms;
reg [6:0]count;
always @(posedge clk)
  begin
    if(rst==0)
      begin
        count<=7'b0000000;
      end
    else
      begin
        timeout100ms<=1'b0;
        if(timeout1ms==1)
          begin
            count<= count+7'b0000001;
            if(count==7'b1100100)
              begin
                timeout100ms<=1'b1;
                count<=7'b0000000;
              end
            else
              begin
                timeout100ms<=1'b0;
              end
          end
      end
  end
endmodule
         
