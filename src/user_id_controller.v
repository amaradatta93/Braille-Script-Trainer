module user_id_controller(clk, rst, id_output, user_allow, q_uid, address_user, pass_allow);

input clk, rst;
input [15:0] q_uid;
input [15:0] id_output;
input user_allow;


output [2:0] address_user;
output pass_allow;
reg pass_allow;
reg [2:0] address_user;

parameter INIT=0;
parameter WAIT_1=1;
parameter WAIT_2=2;
parameter COMPARE=3;
parameter ASSIGN=4;
parameter FINISH=5;

reg [2:0] state;

always@(posedge clk)
	begin
		if (rst==1'b0)
			begin
				state<=INIT;
			end
		else
			begin
				case(state)
					
					INIT:
						begin
							pass_allow<=1'b0;
							address_user<=3'b000;
							if(user_allow==1'b1)
								begin
									state<=WAIT_1;
								end
						end
					
					WAIT_1:
						begin
							state<=WAIT_2;
						end
					
					WAIT_2:
						begin
							state<=COMPARE;
						end	
						
					COMPARE:
						begin
							if (q_uid==id_output)
								begin
									state<=ASSIGN;
								end
							else
								begin
									if(address_user==3'b100)
										begin
											state<=FINISH;
										end
									else
										begin
											address_user<=address_user+1;
											state<=WAIT_1;
										end		
								end
						end
					
					ASSIGN:
						begin
							pass_allow<=1'b1;
							state<=state;
						end
					
					FINISH:
						begin
							state<=state;
						end
						
					endcase
			end
	end


endmodule 