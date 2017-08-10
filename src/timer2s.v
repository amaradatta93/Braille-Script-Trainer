
module timer2s(clk, rst, en, timeout2s);
input clk, rst, en;
output timeout2s;
wire t1ms, t100ms, t1s;
lfsr1ms2s lfsr(clk, rst, en, t1ms);
counter100ms counter100(t1ms, clk, rst, t100ms);
counter1s counter1(t100ms, clk, rst, t1s);
counter2s counter2(t1s, clk, rst, timeout2s);
endmodule



