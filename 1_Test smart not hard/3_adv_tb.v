`timescale 1ns/1ns  //set timescale to nanosec
module adv_tb();

reg [3:0]a_tb;
reg [3:0]b_tb;
reg cin_tb;
wire [3:0]out_tb;
wire cout_tb;
integer i,j,k,m;

//Device under test
full_add_4 DUT(.A(a_tb),
               .B(b_tb),
			   .Cin(cin_tb),
			   .Sum(out_tb),
			   .Cout(cout_tb));
			   
initial
begin
	m=0;
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
				m=m+1;
				if({cout_tb,out_tb}==a_tb+b_tb+cin_tb)
					$display("%d. a = %b , b = %b , cin = %b , Test passed",m,a_tb,b_tb,cin_tb);
				else
					$display("%d. a = %b , b = %b , cin = %b , Test Failed",m,a_tb,b_tb,cin_tb);
			end
		end
	end
end

endmodule