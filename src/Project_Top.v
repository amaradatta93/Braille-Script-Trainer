
module Project_Top(Clk,Rst,B_In,Seg_RAG_Out,Seg_Counter_Out,Seg_Alphabet_Out, B_Inp, Switch);

input Clk,Rst;
input B_In,B_Inp;
input[5:0] Switch;

output[6:0] Seg_RAG_Out,Seg_Counter_Out,Seg_Alphabet_Out;

wire B_Out, enable,B_Outp, segen, Pulse, enablel;  
wire [3:0] SwitchOut, SwitchOutdisp;
wire [3:0]q, RAG_Out, Counter_Out;  

LFSR_RAG L2(Rst,Clk, q); //Random Alphabet Displayed on 7-Segment Display When button is pushed
Button_Shaper B(B_In,B_Out,Clk,Rst);
Load Lo (q,RAG_Out,B_Out,Clk,Rst, enable);
Seven_Seg_Decoder S(RAG_Out,Seg_RAG_Out,enable);

Button_Shaper B1(B_Inp,B_Outp,Clk,Rst); //SwitchOut=Switch Value when load button pressed
Switch2Alphabet SA(SwitchOut, Switch);//To convert SwitchOut from 6 bit to 4 bit to match 4 bit value of Alphabet
Load Lop (SwitchOut,SwitchOutdisp,B_Outp,Clk,Rst, enablel);
Seven_Seg_Decoder S2(SwitchOutdisp,Seg_Alphabet_Out,segen);

comparenew Cmp(Clk,Rst,B_Outp,RAG_Out,SwitchOut,Pulse,segen);
Counter Cntr(Rst,Clk,Pulse,Counter_Out);
segment7 S3(Counter_Out,Seg_Counter_Out);

endmodule
