// ECE 6370
// Author: Jaffer Mohammed Ismail, 6565
//Author: Amara Datta Sachidananda.
// 0-F seven segment display module

`timescale 1ns/1ns

module _sevenseg_(value,seg);
	
	//input valid;
	input [3:0] value;
	output [6:0] seg;
	reg [6:0] seg;
	
	always@(value)
		begin
			//if(valid==1'b1)
				//begin
					case(value)
			
				4'b0000: //display '0'
					begin
						seg=7'b1000000;
					end	
				
				4'b0001://display '1' 
					begin
						seg=7'b1111001;
					end
			
				4'b0010: //display '2'
					begin
						seg=7'b0100100;
					end
			
				4'b0011: //display '3'
					begin
						seg=7'b0110000;
					end
				
				4'b0100: //display '4'
					begin
						seg=7'b0011001;
					end
			
				4'b0101: //display '5'
					begin
					seg=7'b0010010;
					end
			
				4'b0110: //display '6'
					begin
						seg=7'b0000010;
					end
			
				4'b0111: //display '7'
					begin
						seg=7'b1111000;
					end
			
				4'b1000: //display '8'
					begin
						seg=7'b0000000;
					end
					
				4'b1001: //display '9'
					begin
						seg=7'b0011000;
					end
			
				4'b1010: //display 'A'
					begin
						seg=7'b0001000;
					end
			
				4'b1011: //display 'B'
					begin
						seg=7'b0000011;
					end
			
				4'b1100: //display 'C'
					begin
						seg=7'b1000110;
					end
				
				4'b1101: //display 'D';
					begin
						seg=7'b0100001;
					end
				
				4'b1110: //display 'E'
					begin
						seg=7'b0000110;
					end
				
				4'b1111: //display 'F'
					begin
						seg=7'b0001110;
					end
				
				default:
					begin
						seg=7'b1000000;
					end
				
			endcase
			//end
			
		end

endmodule