module mode_selection(clk, rst,pass_load, mode_selector, mode_ip, l_m, a_m, g_m);

input clk, rst;
input mode_selector;
input [1:0] mode_ip;
input pass_load;
output l_m, a_m, g_m;

reg l_m, a_m, g_m;

always @(posedge clk)
	begin
		if(rst == 0)
		begin
			l_m <= 0;
			g_m <= 0;
			a_m <= 0;
		end  
	else 
		begin
			if(mode_selector == 1)
				begin
					if(pass_load==1)
						begin
							case(mode_ip)
	
								2'b01:
									begin
										l_m <= 1;
										g_m <= 0;
										a_m <= 0;
									end

								2'b10:
									begin
										l_m <= 0;
										g_m <= 0;
										a_m <= 1;
									end

								2'b11:
									begin
										l_m <= 0;
										g_m <= 1;
										a_m <= 0;
									end

								default:
									begin
										l_m <= 0;
										g_m <= 0;
										a_m <= 0;
									end

							endcase	
						end
				end
		end	
end		
endmodule 