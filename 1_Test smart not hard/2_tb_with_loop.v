`timescale 1ns/1ns  //set timescale to nanosec
module tb_with_loop();

reg [3:0]a_tb;
reg [3:0]b_tb;
reg cin_tb;
wire [3:0]out_tb;
wire cout_tb;
integer i,j,k;

//Device under test
full_add_4 DUT(.A(a_tb),
               .B(b_tb),
			   .Cin(cin_tb),
			   .Sum(out_tb),
			   .Cout(cout_tb));
			   
initial
begin
	for (i=0;i<16;i=i+1)
	begin
		a_tb<=i;
		for (j=0;j<16;j=j+1)
		begin
			b_tb<=j;
			for (k=0;k<2;k=k+1)
			begin
				cin_tb<=k;
				#(10);
			end
		end
	end
end

endmodule