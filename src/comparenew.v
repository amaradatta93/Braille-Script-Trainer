module comparenew(clk, rst, valid, rngout, playeralph, pulse, segen);
input clk, valid, rst;
input [3:0]rngout, playeralph;
output reg pulse, segen;
parameter init=0, waitc=1;
reg state;
  always @(posedge clk)
    begin
      if(rst==0)
        begin
          segen<=0;
          pulse<=0;
          state<=init;
        end
      else
        begin
          case(state)
            init:
              begin
                pulse<=1'b0;
                if(valid==1)
                  begin
                    segen<=1;
                    if(rngout==playeralph)
                      begin
                        pulse<=1'b1;
                        state<= waitc;
                      end
                  end
                else
                  begin
                    state<=init;
                  end 
              end 
            waitc:
              begin
                pulse<=1'b0;
                state<=init;
            end
       default:
              begin
                pulse<=1'b0;
                state<=init;
              end
           endcase
  end
end
endmodule
