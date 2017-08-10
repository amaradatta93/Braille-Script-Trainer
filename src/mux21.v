
module mux21(enable, in1, in2, out);

input enable;
input [6:0]in1, in2;
 output reg [6:0]out;

always @(in1, in2)
begin
case(enable)
1'b1: out<=in2;
1'b0:out<=in1;
endcase
end
endmodule
