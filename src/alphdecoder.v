//ECE 6370
//Coverting 6bit user input to 4 bit

module alphdecoder(user, out);
 input [5:0]user;
 output [3:0]out;
reg [3:0]i;

  always@(user) 
   begin
   case (user)
    6'b000001:
     begin
	i = 4'b0000;
     end
    6'b000101:
     begin
	i = 4'b0001;
     end
    6'b000011:
     begin
	i = 4'b0010;
     end
    6'b001011:
     begin
	i = 4'b0011;
     end
    6'b001001:
     begin
	i = 4'b0100;
     end
    6'b000111:
     begin
	i = 4'b0101;
     end
    6'b001111:
     begin
	i = 4'b0110;
     end
    6'b001101:
     begin
	i = 4'b0111;
     end
    6'b000110:
     begin
	i = 4'b1000;
     end
    6'b001110:
     begin
	i = 4'b1001;
     end
    6'b010101:
     begin
	i = 4'b1010;
     end
    6'b011001:
     begin
	i = 4'b1011;
     end
    6'b010111:
     begin
	i = 4'b1100;
     end
    6'b010110:
     begin
	i = 4'b1101;
     end
    6'b110001:
     begin
	i = 4'b1110;
     end
    6'b111011:
     begin
	i = 4'b1111;
     end
    default:
     begin
	i = 4'b0000;
     end
   endcase
   end
assign out=i;
endmodule 
   