// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
// 1ms test module

`timescale 1ns/1ns

module lfsr_1mstest;

reg clk, rst;
wire timeout_1ms;
//wire [15:0] q;


l_f_s_r_count_1ms l_f_s_r_1mstest(clk, rst,timeout_1ms); 

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