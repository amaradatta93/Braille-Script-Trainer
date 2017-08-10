// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
// 0-F seven segment display module

`timescale 1ns/1ns

module blinking_sevenseg(clk, rst, value,timeout_1s,seg_uid);
	
	//input valid;
	input clk, rst;
	input [3:0] value;
	input timeout_1s;
	output [6:0] seg_uid;
	reg [6:0] seg_uid;
	
	always@(posedge clk)
		begin
			if(rst==1'b0)
				begin
					seg_uid=7'b1111111;
				end
			else
				begin
					case(value)
			
				4'b0000: //display '0'
					begin
						seg_uid=7'b1000000;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end	
				
				4'b0001://display '1' 
					begin
						seg_uid=7'b1111001;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
			
				4'b0010: //display '2'
					begin
						seg_uid=7'b0100100;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
			
				4'b0011: //display '3'
					begin
						seg_uid=7'b0110000;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
				
				4'b0100: //display '4'
					begin
						seg_uid=7'b0011001;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
			
				4'b0101: //display '5'
					begin
					seg_uid=7'b0010010;
					if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
			
				4'b0110: //display '6'
					begin
						seg_uid=7'b0000010;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
			
				4'b0111: //display '7'
					begin
						seg_uid=7'b1111000;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
			
				4'b1000: //display '8'
					begin
						seg_uid=7'b0000000;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
					
				4'b1001: //display '9'
					begin
						seg_uid=7'b0011000;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
			
				4'b1010: //display 'A'
					begin
						seg_uid=7'b0001000;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
			
				4'b1011: //display 'B'
					begin
						seg_uid=7'b0000011;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
			
				4'b1100: //display 'C'
					begin
						seg_uid=7'b1000110;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
				
				4'b1101: //display 'D';
					begin
						seg_uid=7'b0100001;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
				
				4'b1110: //display 'E'
					begin
						seg_uid=7'b0000110;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
				
				4'b1111: //display 'F'
					begin
						seg_uid=7'b0001110;
						if(timeout_1s==1'b1)
							begin
							 seg_uid=7'b1111111;
							end
					end
				
				default:
					begin
						seg_uid=7'b1000000;
					end
				
			endcase
			end
			
		end

endmodule