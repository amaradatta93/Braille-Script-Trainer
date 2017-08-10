

module lfsr1ms2s(clk, rst, enable, timeout1ms);
input clk, rst, enable;
output reg timeout1ms;
reg [15:0]lfsr;
always @(posedge clk)
  begin
    if(rst==0)
      begin
        lfsr<=16'hffff;
      end
    else
      begin
        if(enable==1)
          begin
            lfsr[0]<=lfsr[1]^lfsr[2]^lfsr[4]^lfsr[15];
            lfsr[15:1]<=lfsr[14:0];
            if(lfsr==16'h2167)
              begin
                timeout1ms<=1'b1;
                lfsr<=16'hffff;
              end
            else
              begin
                timeout1ms<=1'b0;
              end
          end
        else
          begin
            lfsr<=16'hffff;
          end
      end
  end
endmodule     
