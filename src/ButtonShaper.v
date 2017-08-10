
//ECE 6370
//Author: Abdullah Farooq, Last 4 digits of PSID: 8975 

module Button_Shaper(B_In,B_Out,Clk,Rst);
input B_In,Clk,Rst;
output reg B_Out;
reg [2:0] State,StateNext;
parameter INIT=0,PULSE=1,WAIT=2;

//CombLogic
always @ (State,B_In)
  begin
    case(State)
      INIT:
        begin
          B_Out=1'b0;
	  if(B_In==0)
            begin
	      StateNext=PULSE;
	    end
	  else
	    begin
	      StateNext=INIT;
	    end
	end
       PULSE:
        begin
          B_Out=1'b1;
	  StateNext=WAIT;
        end
       WAIT:
        begin
          B_Out=1'b0;
          if(B_In==0)
            begin
	      StateNext=WAIT;
	    end
	  else
	    begin
	      StateNext=INIT;
	    end
       end
       
       default:
          begin
            B_Out=1'b0;
            StateNext=INIT;
          end
    endcase
  end

//StateReg
always@(posedge Clk)
  begin
    if(Rst==0)
      State <=INIT;
    else
      State <=StateNext;
  end

endmodule
