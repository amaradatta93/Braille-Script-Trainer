`timescale 1ns/1ns


module PASS_ROM_contorller_tb;

reg clk, rst;
reg pass_allow;
reg [3:0] pass_input;
reg pass_load;
reg pass_pound;

wire [7:0] q_pwd;
reg [2:0] address_user;

wire [5:0] address_pass;
wire allow;
wire flag;
wire wrong_pwd;


PASS_ROM_controller_mod PASS_ROM_contorller_DUT(clk, rst, pass_allow, pass_input, pass_load, pass_pound, address_user,  q_pwd, address_pass, allow, flag, wrong_pwd);
ROM_pass ROM_pass_DUT(address_pass, clk, q_pwd);


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
		pass_load<=1'b0;
		pass_pound<=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_allow<=1'b1;
		address_user<=3'b010;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		rst<=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_input<=4'b1100;
		@(posedge clk);
		@(posedge clk);
		pass_load<=1'b1;
		@(posedge clk);
		pass_load<=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_input<=4'b1100;
		@(posedge clk);
		@(posedge clk);
		pass_load<=1'b1;
		@(posedge clk);
		pass_load<=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_input<=4'b1100;
		@(posedge clk);
		@(posedge clk);
		pass_load<=1'b1;
		@(posedge clk);
		pass_load<=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_input<=4'b0001;
		@(posedge clk);
		@(posedge clk);
		pass_load<=1'b1;
		@(posedge clk);
		pass_load<=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		pass_pound<=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		
	end


endmodule
