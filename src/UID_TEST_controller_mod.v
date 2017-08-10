module UID_TEST_controller_mod(clk, rst, q, address);

input clk, rst;
input [15:0] q;
output [2:0] address;
reg [2:0] address;

parameter INIT=2'b00;
parameter WAIT_1=2'b01;
parameter WAIT_2=2'b10;
parameter FINISH=2'b11;

reg [1:0] state;

always@(posedge clk)
	begin
		if (rst==1'b0)
			begin
				state<=INIT;
				address<=3'b000;
			end
		else
			begin
				case(state)
					
					INIT:
						if(address==3'b101)
							begin
								state<=FINISH;
							end
						else
							begin
								state<=WAIT_1;
								address<=address+1;
							end
					
					WAIT_1:
						begin
							state<=WAIT_2;
						end
						
					WAIT_2:
						begin
							state<=INIT;
						end
					
					FINISH:
						begin
							state<=state;
						end
					
				endcase
			end
	end


endmodule