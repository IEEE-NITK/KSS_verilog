`timescale 1ns/1ns  //set timescale to nanosec
module basic_tb();

reg [3:0]a_tb;
reg [3:0]b_tb;
reg cin_tb;
wire [3:0]out_tb;
wire cout_tb;

//Device under test
full_add_4 DUT(.A(a_tb),
               .B(b_tb),
			   .Cin(cin_tb),
			   .Sum(out_tb),
			   .Cout(cout_tb));
			   
initial
begin
	#0 a_tb=4; b_tb=5 ; cin_tb=1 ;
	#100  a_tb=9; b_tb=5 ; cin_tb=1;
	#100  a_tb=9; b_tb=9 ; cin_tb=1;
	#100 $stop;
end

endmodule