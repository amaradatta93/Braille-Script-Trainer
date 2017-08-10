// ECE6370
// Author: Sindhoora Surapaneni, 0233
// gt1
// this module gives first digit of timer which decrements on 1s timeout

module gt1(clk, rst, dec, stopprev, borrow, d, stop);
input clk, rst, dec, stopprev;
output reg borrow, stop;
output reg [3:0]d;
parameter init=0, dc9=1, dc8=2, dc7=3, dc6=4, dc5=5, dc4=6, dc3=7, dc2=8, dc1=9, dc0=10, last=11;
reg [3:0]state;
always @(posedge clk)
  begin
    if (rst==0)
      begin
        stop<=0;
        d<=4'h9;
        borrow<=0;
        state<=init;
      end
    else
      begin
      case(state)
        init:
          begin
            borrow<=1'b0;
            d<=4'h9;
            if(dec==1)
              begin
                state<= dc8;
              end
            else
              begin
                state<=init;
              end
          end
        dc8:
          begin
            d<=4'h8;
            if(dec==1)
              begin
                state<= dc7;
              end
            else
              begin
                state<=dc8;
              end
          end
        dc7:
          begin
            d<=4'h7;
            if(dec==1)
              begin
                state<= dc6;
              end
            else
              begin
                state<=dc7;
              end
          end
        dc6:
          begin
            d<=4'h6;
            if(dec==1)
              begin
                state<= dc5;
              end
            else
              begin
                state<=dc6;
              end
          end
        dc5:
          begin
            d<=4'h5;
            if(dec==1)
              begin
                state<= dc4;
              end
            else
              begin
                state<=dc5;
              end
          end
        dc4:
          begin
            d<=4'h4;
            if(dec==1)
              begin
                state<=dc3;
              end
            else
              begin
                state<=dc4;
              end
          end
        dc3:
          begin
            d<=4'h3;
            if(dec==1)
              begin
                state<= dc2;
              end
            else
              begin
                state<=dc3;
              end
          end
        dc2:
          begin
            d<=4'h2;
            if(dec==1)
              begin
                state<= dc1;
              end
            else
              begin
                state<=dc2;
              end
          end
        dc1:
          begin
            d<=4'h1;
            if(dec==1)
              begin
                state<= dc0;
              end
            else
              begin
                state<=dc1;
              end
          end
        dc0:
          begin
            d<=4'h0;
            if(dec==1)
              begin
                if(stopprev==1'b0)
                  begin
                    borrow<=1'b1;
                    state<=init;
                  end
                else
                  begin
                    borrow<=1'b0;
                    state<=last;
                  end
              end
            else
              begin
                state<=dc0;
              end
          end
        last:
          begin
            stop<=1'b1;
          end
        default:
          begin
            state<=init;
          end
      endcase
      end
  end
endmodule

