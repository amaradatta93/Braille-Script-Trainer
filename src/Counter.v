//ECE 6370
//Author: Abdullah Farooq, Last 4 digits of PSID: 8975 

module Counter(Rst,Clk,Pulse,Counter_Out);
input Rst,Clk;
input Pulse;
output reg[3:0] Counter_Out;


always @(posedge Clk)
begin
  if(Rst==0)
  begin
    Counter_Out <=4'b0000;
  end

  else 
  begin
    if(Pulse==1)
    begin
    Counter_Out <= Counter_Out + 1;
  end
end
end
endmodule
