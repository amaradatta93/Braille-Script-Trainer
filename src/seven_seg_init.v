module seven_seg_init(clk, rst, mode_selector, seg_usr, seg_uid, seg_pwd);

input clk, rst;
input mode_selector;
output [6:0] seg_pwd, seg_usr,seg_uid;
reg [6:0] seg_pwd, seg_usr,seg_uid;

parameter INIT=0;
parameter END1=1;

reg state;

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
							if(mode_selector==1'b1)
								begin
									seg_usr<=7'b1111111;
									seg_pwd<=7'b1111111;
									seg_uid<=7'b1111111;
									state<=END1;
								end
						end
					
					END1:
						begin
							state<=state;
						end
				endcase
				
			end
			
	end

endmodule