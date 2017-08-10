// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
// 1 second module

`timescale 1ns/1ns

module l_f_s_r_count1s(clk, rst,count_1s, timeout_1s);

input clk, rst;
output timeout_1s;
reg timeout_1s;

wire timeout_100ms;


output [3:0]count_1s;
reg [3:0] count_1s;

parameter INIT=0;
parameter PULSE1=1;



wire [6:0]count;
reg state;

l_f_s_r_count100ms l_f_s_r_count100ms_dut(clk, rst, count, timeout_100ms );


always@(posedge clk)
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
							timeout_1s<=1'b0;
							count_1s<=4'b0000;
							state<=PULSE1;
						end
					
												
					
					PULSE1:
						begin
							if(timeout_100ms==1)
								begin
									count_1s=count_1s+1;
									if(count_1s==4'b1010)
										begin
											timeout_1s<=1'b1;
											state<=INIT;
										end
									else
										begin
											state<=PULSE1;
										end
								end	
						end
					
										
					default:
						begin
							state<=INIT;
						end
				endcase	
			end
	end
endmodule