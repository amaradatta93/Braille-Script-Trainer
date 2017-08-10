// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
// 1ms test module



`timescale 1ns/1ns
module lfsr_tb;

reg clk, rst;
//wire [15:0]q;

wire timeout;


l_f_s_r_count_1ms lfrs_test(clk, rst,timeout);

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
		#5 rst=1'b1;
	end
	
endmodule