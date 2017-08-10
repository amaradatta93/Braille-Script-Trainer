module PASS_ROM_controller_mod(clk, rst, pass_allow, pass_input, pass_load, pass_pound, address_user,  q_pwd, address_pass, allow, flag, wrong_pwd);

input clk, rst;
input pass_allow;
input [3:0] pass_input;
input pass_load;
input pass_pound;

input [7:0] q_pwd;
input [2:0] address_user;

output wrong_pwd;
output [5:0] address_pass;
output allow;
output flag;
reg allow;
reg wrong_pwd;
reg [5:0] address_pass;
reg flag;

parameter INIT=0;
parameter WAIT_1=1;
parameter WAIT_2=2;
parameter CHECK=3;
parameter FINISH=4;

reg [2:0] state;

always@(posedge clk)
	begin
		if (rst==1'b0)
			begin
				state<=INIT;
				allow<=1'b0;
			end
		else
			begin
				case(state)
					
					INIT:
						begin
							if(pass_allow==1'b1)
								begin
									flag<=1'b0;
									allow<=1'b0;
									wrong_pwd<=1'b0;
									address_pass<={address_user, 3'b000};
									state<=WAIT_1;
								end
						end
						
					WAIT_1:
						begin
							state<=WAIT_2;
						end
					
					WAIT_2:
						begin
							state<=CHECK;
						end
						
					CHECK:
						begin
							if(pass_pound==1'b1 & q_pwd!=8'h1F)
								begin
									if(pass_load==1'b1)
										begin
											if({3'b000,pass_input}==q_pwd)
												begin
													address_pass<=address_pass+1;
													state<=WAIT_1;
												end
											else
												begin
													flag<=1'b1;
													address_pass<=address_pass+1;
													state<=WAIT_1;
												end
										end
								end
							else
								begin
									if(pass_pound==1'b0)
										begin
											if(q_pwd==8'h1F)
												begin
													if(flag==1'b1)
														begin
															allow<=1'b0;
															wrong_pwd<=1'b1;
															state<=FINISH;
														end
													else 
														begin
															allow<=1'b1;
															state<=FINISH;
														end
												end
											else
												begin
													allow<=1'b0;
													wrong_pwd<=1'b1;
													state<=FINISH;
												end
										end
									
								end
						end
					
					FINISH:
						begin
							state<=state;
						end
					
				endcase
			end
	end


endmodule