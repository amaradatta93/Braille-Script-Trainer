//ECE 6370
//Seven Segment for Game

module seg7rndalph(bit4_in, bit7_out, enable);

 input enable;
 input [3:0] bit4_in;
 output reg [6:0] bit7_out;
 

 always @ (bit4_in)
  begin
  if (enable== 1) begin
   case (bit4_in)
    4'b0000:
     begin
	bit7_out = 7'b0001000;
     end
    4'b0001:
     begin
	bit7_out = 7'b0000000;
     end
    4'b0010:
     begin
	bit7_out = 7'b1000110;
     end
    4'b0011:
     begin
	bit7_out = 7'b0100001;
     end
    4'b0100:
     begin
	bit7_out = 7'b0000110;
     end
    4'b0101:
     begin
	bit7_out = 7'b0001110;
     end
    4'b0110:
     begin
	bit7_out = 7'b0010000;
     end
    4'b0111:
     begin
	bit7_out = 7'b0001001;
     end
    4'b1000:
     begin
	bit7_out = 7'b1111001;
     end
    4'b1001:
     begin
	bit7_out = 7'b1110001;
     end
    4'b1010:
     begin
	bit7_out = 7'b1000111;
     end
    4'b1011:
     begin
	bit7_out = 7'b1000000;
     end
    4'b1100:
     begin
	bit7_out = 7'b0001100;
     end
    4'b1101:
     begin
	bit7_out = 7'b0001100;
     end
    4'b1110:
     begin
	bit7_out = 7'b1000001;
     end
    4'b1111:
     begin
	bit7_out = 7'b0010001;
     end
   endcase
  end
else
  begin
    bit7_out = 7'b0111111;
  end
  end
endmodule 

