`timescale 1ns/1ns

module user_id_controller_test;

reg clk, rst;
reg [15:0] id_output;
reg user_allow;

wire pass_allow;
wire [2:0] address_user;
wire [15:0] q_uid;

 
user_id_controller user_id_controller_dut(clk, rst, id_output, user_allow, q_uid, address_user, pass_allow);
user_id_file user_id_file(address_user, clk, q_uid);


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
		user_allow=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		id_output<=16'b1100110011000011;
		@(posedge clk);
		rst<=1;
		@(posedge clk);
		
	end


endmodule