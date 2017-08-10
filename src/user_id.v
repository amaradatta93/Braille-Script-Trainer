module user_id(clk, rst,auth, load_input, id_input, id_output, user_allow, user_seg);

input clk, rst;
input load_input;
input auth;
input [3:0] id_input;


output [3:0] user_seg;
output [15:0] id_output;
output user_allow;
reg [15:0] id_output;
reg pass_user;
reg [3:0] user_seg;
reg user_allow;


reg	[3:0] A,B,C,D;

parameter INIT=0;
parameter NEXT=1;
parameter NEXT1=2;
parameter NEXT2=3;
parameter CONCAT=4;

reg [2:0] state; 

always@(posedge clk)
begin
	if (rst==0)
		begin
			state<=INIT;
		end
	
	else
		begin
			case(state)
				
				INIT: 
					begin
						if(auth==1'b1)
							begin
						user_allow<=1'b0;
						id_output<=16'b0000000000000000;
						user_seg<=4'b0000;
						if (load_input==1)
							begin
								A<=id_input;
								user_seg<=id_input;
								state<=NEXT;
							end
							end
					end
					
				NEXT:
					begin
						if (load_input==1)
							begin
								B<=id_input;
								user_seg<=id_input;
								state<=NEXT1;
							end
					end
				
				NEXT1:
					begin
						if(load_input==1)
							begin
								C<=id_input;
								user_seg<=id_input;
								state<=NEXT2;
							end
					end
					
				NEXT2:
					begin
						if(load_input==1)
							begin
								D<=id_input;
								user_seg<=id_input;
								state<=CONCAT;
							end
					end
				
				CONCAT:
					begin
						user_allow<=1'b1;
						id_output<={A,B,C,D};
						state<=state;
					end
				
				default:
					begin
						state<=INIT;
					end
			endcase					
end
end
endmodule


