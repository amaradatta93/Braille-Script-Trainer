// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
// 100ms test module



`timescale 1ns/1ns
module l_f_s_r_count100mstest;

reg clk,rst;
wire timeout_100ms;
wire [6:0] count;

l_f_s_r_count100ms l_f_s_r_count100tb(clk,rst,count, timeout_100ms);

//clock procedure
always
	begin
	    clk<=1'b0;
		#10;
		clk<=1'b1;
		#10;
	end

initial
	begin
		rst=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		#10 rst=1'b1;
	end

endmodule
