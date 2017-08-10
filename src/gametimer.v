// ECE6370
// Author: Sindhoora Surapaneni, 0233
// gametimer
// this module gives 1 minute timer

module gametimer(clk, rst, enable, d1, d2, stop);
input clk, rst, enable;
output stop;
output [3:0]d1;
output [3:0]d2;
wire tout1s, bprev, sprev;
timer1s timersec(clk, rst, enable, tout1s);
gt1 gt1mod(clk, rst, tout1s, sprev, bprev, d1, stop);
gt2 gt2mod(clk, rst, bprev, d2, sprev);
endmodule

