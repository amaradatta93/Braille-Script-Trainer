// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
// 1 second test module


`timescale 1ns/100ps
module l_f_s_r_count1stest;

reg clk,rst;
wire timeout_1s;
wire [3:0] count;


l_f_s_r_count1s l_f_s_r_count1stb(clk,rst,count, timeout_1s);

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
		rst=1'b1;
	end

endmodule
