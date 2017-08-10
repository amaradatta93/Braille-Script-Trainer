module scorectrl(clk, rst, enable, d1, d2);
input clk, rst, enable;
output [3:0]d1, d2;
wire bprev;
scdig1 dig1(clk, rst, enable, bprev, d1);
scdig2 dig2(clk, rst, bprev, d2);
endmodule 