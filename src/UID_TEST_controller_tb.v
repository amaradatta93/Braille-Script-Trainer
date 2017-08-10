`timescale 1ns/1ns

module UID_TEST_controller_tb;

reg clk, rst;
wire [2:0] address;

wire [15:0] q;
 

UID_TEST_controller_mod UID_TEST_controller_DUT(clk, rst, q, address);
user_id_file user_id_DUT(address, clk, q);


always
	begin
		clk<=1'b0;
		#10; 
		clk<=1'b1;
		#10;
	end

initial
	begin
		rst<=0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		#5 rst<=1;
		@(posedge clk);
	end


endmodule