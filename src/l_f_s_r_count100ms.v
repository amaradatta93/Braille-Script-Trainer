// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
// 100ms test module

`timescale 1ns/1ns
module l_f_s_r_count100ms(clk, rst,count,timeout_100ms);

input clk, rst;
output timeout_100ms;
reg timeout_100ms;

wire timeout_1ms;


output [6:0]count;
reg [6:0] count;

parameter INIT=0;
parameter PULSE=1;


reg state;

l_f_s_r_count_1ms l_f_s_r_count_1ms_dut(clk, rst, timeout_1ms );

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
							timeout_100ms<=1'b0;
							count<=7'b0000000;
							state<=PULSE;
						end
				
					PULSE:
						begin
							if(timeout_1ms==1)
								begin
									count=count+1;
									if(count==7'b1100100)
										begin
											timeout_100ms<=1'b1;
											state<=INIT;
										end
									else
										begin
											state<=PULSE;
										end
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
endmodule