// ECE6370
// Author: Sindhoora Surapaneni, 0233
// counter1s
// this module gives 1s time

module counter1s(timeout100ms, clk, rst, timeout1s);
input clk, rst, timeout100ms;
output reg timeout1s;
reg [3:0]count;
always @(posedge clk)
  begin
    if(rst==0)
      begin
        count<=4'h0;
      end
    else
      begin
        timeout1s<=1'b0;
        if(timeout100ms==1)
          begin
            count<=count+4'b0001;
            if(count==4'b1010)
              begin
                timeout1s<=1'b1;
                count<=4'h0;
              end
            else
              begin
                timeout1s<=1'b0;
              end
          end
      end
  end
endmodule

