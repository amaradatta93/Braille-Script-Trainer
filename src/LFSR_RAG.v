//ECE 6370
//Author: Abdullah Farooq, Last 4 digits of PSID: 8975 

module LFSR_RAG(Rst,Clk, q);
input Clk,Rst;
//input B_In;
//output B_Out;
output [3:0] q;//,RAG_Out;
//output[6:0] Seg_RAG_Out;
reg [3:0] LFSR;
wire feedback = LFSR[3];

always @(posedge Clk)
begin
  if(Rst==0)
  begin
    LFSR<=4'b1111;
  end
    
  else
  begin	
    LFSR[0] <= feedback;
    LFSR[1] <= LFSR[0] ^ feedback;
    LFSR[2] <= LFSR[1];
    LFSR[3] <= LFSR[2];	
        
  end
end

assign q = LFSR;

endmodule

