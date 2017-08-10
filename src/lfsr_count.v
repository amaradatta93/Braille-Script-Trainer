`timescale 1ns/1ns
// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
// i ms module

module l_f_s_r_count_1ms(clk,rst,timeout);
  
input clk,rst;
//output [15:0] q;

output timeout;
reg timeout;


reg [15:0] LFSR;
wire feedback = LFSR[15];



parameter INIT=0;
parameter PULSE=1;

reg state;


always @(posedge clk)
	begin
		if(rst==0)
			begin
				state<=INIT;
			end
		else
			begin
				case(state)
				
					INIT:
						begin
							LFSR<=16'b1111111111111111;
							timeout<=1'b0;
							state<=PULSE;
						end
				
					PULSE:
						begin	
							LFSR[0] <= feedback;
							LFSR[1] <= LFSR[0];
							LFSR[2] <= LFSR[1] ^ feedback;
							LFSR[3] <= LFSR[2] ^ feedback;
							LFSR[4] <= LFSR[3];
							LFSR[5] <= LFSR[4] ^ feedback;
							LFSR[6] <= LFSR[5];
							LFSR[7] <= LFSR[6];
							LFSR[8] <= LFSR[7];
							LFSR[9] <= LFSR[8];
							LFSR[10] <= LFSR[9];
							LFSR[11] <= LFSR[10];
							LFSR[12] <= LFSR[11];
							LFSR[13] <= LFSR[12];
							LFSR[14] <= LFSR[13];
							LFSR[15] <= LFSR[14];
							if (LFSR==16'b1011011011110101)
								begin
									timeout<=1'b1;
									state<=INIT;
								end
							else
								begin
									state<=PULSE;
								end
						end
						
						
					default:
						begin
							state<=INIT;
						end
				endcase
			end
	end

// assign q = LFSR;
 
  
  
endmodule