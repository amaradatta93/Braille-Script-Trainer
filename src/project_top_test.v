`timescale 1ns/1ns

module project_top_test;

reg clk, rst;
reg load_input_board ,pass_load_board ,pass_pound;
reg [3:0] id_input,pass_input;


wire allow;
wire [6:0] seg_usr,seg_pwd,seg_uid;

project_test project_test_top(clk, rst, load_input_board, id_input, pass_input, pass_load_board, pass_pound, seg_usr, seg_uid, seg_pwd, allow );

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
		load_input_board=1'b0;
		pass_load_board<=1'b0;
		pass_pound<=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		rst=1'b1;
		@(posedge clk);
		@(posedge clk);
		id_input=4'b1100;
		@(posedge clk);
		@(posedge clk);
		load_input_board=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		load_input_board=1'b0;
		@(posedge clk);
		@(posedge clk);
		id_input=4'b1100;
		@(posedge clk);
		@(posedge clk);
		load_input_board=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		load_input_board=1'b0;
		@(posedge clk);
		@(posedge clk);
		id_input=4'b1100;
		@(posedge clk);
		@(posedge clk);
		
		load_input_board=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		load_input_board=1'b0;
		@(posedge clk);
		@(posedge clk);
		id_input=4'b0011;
		@(posedge clk);
		@(posedge clk);
		load_input_board=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		load_input_board=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		// password
		
		@(posedge clk);
		@(posedge clk);
		pass_input<=4'b1100;
		@(posedge clk);
		@(posedge clk);
		pass_load_board<=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_load_board<=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_input<=4'b1100;
		@(posedge clk);
		@(posedge clk);
		pass_load_board<=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_load_board<=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_input<=4'b1100;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_load_board<=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_load_board<=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_input<=4'b0011;
		@(posedge clk);
		@(posedge clk);
		pass_load_board<=1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		pass_load_board<=1'b0;
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
		pass_pound<=1'b1;
		
		
		
		
		
		
		
		
	end

endmodule