// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
// Button Shaper Module.
`timescale 1ns/1ns

module button_shaper(clk,rst, but_in, but_out);

input but_in;
output but_out;
input clk,rst;

reg but_out;

parameter INIT = 0;
parameter PULSE = 1;
parameter WAIT = 2;

reg [1:0] state,state_next;

//
always@(state, but_in )
	begin
		case(state)
			INIT:
				begin
					but_out = 1'b0;
					if (but_in==0)
						begin
							state_next <= PULSE;
						end
					else
						begin
							state_next <= INIT;
						end
				end
			
			PULSE:
				begin
					but_out<=1'b1;
					state_next<=WAIT;
				end
			
			WAIT:
				begin
					but_out<=1'b0;
					if (but_in==0)
						begin
							state_next<=WAIT;
						end
					else 
						begin
							state_next<=INIT;
						end
				end
			
			default:
				begin
					state_next<=INIT;
				end
		endcase			
	end

// StateReg
always @(posedge clk ) 
	begin
		if(rst==0)
			begin
				state<=INIT;
			end
		else
			begin
				state<=state_next;
			end
		end

endmodule