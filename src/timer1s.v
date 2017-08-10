//ECE6370
// Author: Sindhoora Surapaneni, 0233
// timer1s
// this module gives 1s timeout

module timer1s(clk, rst, en, timeout1s);
input clk, rst, en;
output timeout1s;
wire t1ms, t100ms;
lfsr1ms lfsr(clk, rst, en, t1ms);
counter100ms counter100(t1ms, clk, rst, t100ms);
counter1s counter1(t100ms, clk, rst, timeout1s);
endmodule


