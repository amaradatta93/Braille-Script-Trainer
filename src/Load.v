//ECE 6370
//Author: Abdullah Farooq, Last 4 digits of PSID: 8975 

module Load(In,Out,Valid,Clk,Rst, enable);
input[3:0] In;
output reg[3:0] Out;
input Valid,Clk,Rst;
output reg enable;

always@(posedge Clk)
begin
  if(Rst==0)
  begin
    Out<=4'b0000;
    enable<=0; //Change from 0000 to 1111
  end
  else
  begin
    if(Valid==1)
    begin
      Out<=In;
      enable<=1;
    end

  end
end

endmodule


