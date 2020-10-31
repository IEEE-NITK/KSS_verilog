module full_add_beh(input a,   //1st input
					input b,   //2nd input
					input cin, // carry in
					output reg out,  //output
					output reg cout);  //carry out
					
	always @(a,b,cin)
	begin
		{cout,out} = a+b+cin;   //behavioral model
	end
endmodule