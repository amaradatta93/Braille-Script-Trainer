//ECE 6370
//Author: Abdullah Farooq, Last 4 digits of PSID: 8975 

module Seven_Seg_Decoder(Seg_In,Seg_Out,Enable);
input[3:0] Seg_In; 
output[6:0] Seg_Out;
reg[6:0] Seg_Out;
input Enable;


always @ (Seg_In)
begin
  if(Enable==1)
  begin
    case(Seg_In)
      4'b0000:
        begin
          Seg_Out=7'b0001000;  
        end
      4'b0001:
        begin
          Seg_Out=7'b0000000;
        end
      4'b0010:
        begin
          Seg_Out=7'b1000110; 
        end
      4'b0011:
        begin
          Seg_Out=7'b0100001;
        end
      4'b0100:
        begin
          Seg_Out=7'b0000110;
        end
      4'b0101:
        begin
          Seg_Out=7'b0001110;
        end
      4'b0110:
        begin
          Seg_Out=7'b0010000;
        end
      4'b0111:
        begin
          Seg_Out=7'b0001001;
        end
      4'b1000:
        begin
          Seg_Out=7'b1111001;
        end
      4'b1001:
        begin
          Seg_Out=7'b1110001;
        end
      4'b1010:
        begin
          Seg_Out=7'b1000111;
        end
      4'b1011:
        begin
          Seg_Out=7'b1000000;
        end
      4'b1100:
        begin
          Seg_Out=7'b0001100;
        end
      4'b1101:
        begin
          Seg_Out=7'b0010010;
        end
      4'b1110:
        begin
          Seg_Out=7'b1000001;
       end
      4'b1111:
        begin
          Seg_Out=7'b1111110;  //0111111
        end
      default:
	begin
	  Seg_Out=7'b1111110;
	end
    endcase
  end

  else
  begin
    Seg_Out=7'b1111110;
  end

end
 
endmodule

