//ECE: 6370
//sorting algorithm

module sort ( en, a1, a2, a3, a4, a5, o1, o2, o3, o4, o5);
  input [3:0] a1, a2, a3, a4, a5;
  output [3:0] o1, o2, o3, o4, o5;
  input en;
  integer i, j;
  reg [3:0] temp;
  reg [3:0] array [1:5];
 
  always @(posedge en)
  begin
  array[1] = a1;
  array[2] = a2;
  array[3] = a3;
  array[4] = a4;
  array[5] = a5;
  for (i = 5; i > 0; i = i - 1) begin
    for (j = 1 ; j < i; j = j + 1) begin
        if (array[j] < array[j + 1])
          begin
            temp = array[j];
            array[j] = array[j + 1];
            array[j + 1] = temp;
          end 
    end
  end
  end
      assign o5 = array[1];
      assign o4 = array[2];
      assign o3 = array[3];
      assign o2 = array[4];
      assign o1 = array[5];
  endmodule
