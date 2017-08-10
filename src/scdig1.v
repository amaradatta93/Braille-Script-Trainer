
module scdig1(clk, rst, en, borrow, d);
input clk, rst, en;
output reg borrow;
output reg [3:0]d;
parameter init=0, dc1=1;
reg [3:0]state;
always @(posedge clk)
  begin
    if (rst==0)
      begin
        borrow<=0;
        d<=4'h0;
        state<=init;
      end
    else
      begin
      case(state)
        init:
          begin
            d<=4'h0;
            borrow<=0;
            state<=dc1;
          end
        dc1:
          begin
            if(en==1)
              begin
                if(d==4'h9)
                  begin
                    borrow<=1'b1;
                    d<=4'h0;
                    state<=init;
                  end
                else
                  begin 
                    d<=d+4'h1; 
                    state<= dc1;
                  end
              end
          end
        default:
          begin
            state<=init;
          end
      endcase
      end
  end
endmodule

