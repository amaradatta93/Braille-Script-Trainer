`timescale 1ns/1ns
module user_id_test;

reg clk, rst;
reg load_input;
reg [3:0] id_input;

wire [15:0] id_output;
wire user_allow;
wire [3:0] user_seg;

user_id user_id_dut(clk, rst, load_input, id_input, id_output, user_allow, user_seg);

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
		load_input=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		rst=1'b1;
		@(posedge clk);
		@(posedge clk);
		id_input=4'b1010;
		@(posedge clk);
		@(posedge clk);
		load_input=1'b1;
		@(posedge clk);
		load_input=1'b0;
		@(posedge clk);
		@(posedge clk);
		id_input=4'b1011;
		@(posedge clk);
		@(posedge clk);
		load_input=1'b1;
		@(posedge clk);
		load_input=1'b0;
		@(posedge clk);
		@(posedge clk);
		id_input=4'b1100;
		@(posedge clk);
		@(posedge clk);
		load_input=1'b1;
		@(posedge clk);
		load_input=1'b0;
		@(posedge clk);
		@(posedge clk);
		id_input=4'b0001;
		@(posedge clk);
		@(posedge clk);
		load_input=1'b1;
		@(posedge clk);
		load_input=1'b0;
		@(posedge clk);
		@(posedge clk);
	end


endmodule

