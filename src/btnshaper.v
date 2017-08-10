module btnshaper(clk,rst, bin, bout);
  input clk, rst, bin;
  output bout;
  reg bout;
  parameter init=0, pulse=1, wait1=2;
  reg [1:0]state;
  always @(posedge clk)
    begin
      if(rst==0)
        begin
          state<=init;
        end
      else
        begin
          case(state)
            init:
              begin
                bout<=1'b0;
                if(bin==0)
                  begin
                    state<=pulse;
                  end
                else
                  begin
                    state<=init;
                  end
              end
            pulse:
              begin
                bout<=1'b1;
                state<=wait1;
              end
            wait1:
              begin
                bout<=1'b0;
                if(bin==1)
                  begin
                    state<=init;
                  end
               else
                 begin
                   state<=wait1;
                 end
             end
           default:
             begin
               bout<=1'b0;
               state<=init;
             end
          endcase
      end
    end
endmodule        
