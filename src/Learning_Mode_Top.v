
module Learning_Mode_Top(Clk,Rst,B_Inp,Switch,Seg_Alphabet_Out);

input Clk,Rst;
input B_Inp;  //B_In,
input[5:0] Switch;

output[6:0] Seg_Alphabet_Out; 

wire enable;
wire B_Out;  //,Pulse,B_Out;
wire [3:0] Alphabet;//,Counter_Out,RAG_Out,Count;
wire [5:0] SwitchOut;
//Seg_RAG_Out,

//LFSR_RAG L2(Rst,Clk, q,RAG_Out,B_In,B_Out,Seg_RAG_Out); //Random Alphabet Displayed on 7-Segment Display When button is pushed

//Learning_Mode L(Rst,Clk,RAG_Out,B_In,B_Out,Seg_RAG_Out,Count);

Button_Shaper B1(B_Inp,B_Out,Clk,Rst);
load6b Lo (Switch, SwitchOut,B_Out,Clk,Rst, enable);//SwitchOut=Switch Value when load button pressed
Switch2Alphabet SA(Alphabet,SwitchOut);//To convert SwitchOut from 6 bit to 4 bit to match 4 bit value of Alphabet

//Compare Cmp(RAG_Out,Alphabet,Clk,Rst,Pulse);
//Counter Cntr(Rst,Clk,Pulse,Counter_Out);
Seven_Seg_Decoder S2(Alphabet,Seg_Alphabet_Out,enable);

endmodule
