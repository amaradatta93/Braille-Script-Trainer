module user_selection(clk, rst, load_input, usr_ip, auth, guest);


input clk, rst;
input usr_ip, load_input;
output reg auth, guest;




always @(posedge clk) 
	begin
		if(rst == 0) 
			begin
				guest<=0;
				auth<=0;
			end  
		else 
			begin 
				if(load_input == 1)
					begin
						if(usr_ip==0)
							begin
								guest<=1;
								auth<=0;
							end
						else
							begin
								guest<=0;
								auth<=1;
							end
					end
			end
	end

endmodule 
