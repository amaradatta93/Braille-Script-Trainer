// ECE6370
// Author: Sindhoora Surapaneni, 0233
// rngenerator
// this module gives random number sequentially and stores it untill next update

module rngenerator(clk, rst, start, update, rngout);
input clk, rst, start, update;
output [3:0]rngout;
wire [15:0]lfsrout;
lfsr_16 lfsrrng(clk, rst, start, lfsrout);
pregister regrng({lfsrout[2], lfsrout[4], lfsrout[8], lfsrout[15]}, clk, rst, update, rngout);
endmodule
