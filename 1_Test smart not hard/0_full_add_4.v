module full_add_4(input [3:0] A, 
		  input [3:0] B,
		  input Cin, 			
		  output reg [3:0] Sum,
		  output reg Cout);

always @(A,B,Cin)
begin
     {Cout,Sum} = A+B+Cin;
end
endmodule  