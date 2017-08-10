// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
// 0-F seven segment display module

`timescale 1ns/1ns

module uid_pwd_sevenseg(clk, rst, auth, timeout_1s, wrong_pwd,seg_usr,seg_pwd);
	
	input clk, rst;
	input wrong_pwd;
	input timeout_1s;
	input auth;
	
	output [6:0] seg_usr, seg_pwd;
	reg [6:0] seg_usr, seg_pwd;
	
	parameter INIT=0;
	parameter BLINK1=1;
	parameter BLINK2=2;
		
	reg [1:0] state;
	
	always@(posedge clk)
		begin
			if(rst==1'b0)
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
										seg_pwd=7'b0001100;
										seg_usr=7'b1000001;	
										if(wrong_pwd==1'b1)
											begin
												if(timeout_1s==1'b1)
													begin
														state<=BLINK1;
													end
											end
									end
							end
							
						BLINK1:
							begin
								if(timeout_1s==1'b1)
									begin
										seg_pwd=7'b1111111;
										state<=BLINK2;
									end
							end
						
						BLINK2:
							begin
								if(timeout_1s==1'b1)
									begin
										seg_pwd=7'b0001100;
										state<=BLINK1;
									end
							end
						
						default
							begin
								state<=INIT;
							end
					endcase
							
				end
		end

endmodule