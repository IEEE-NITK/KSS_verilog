module full_add_gate(input a,   //1st input
					input b,   //2nd input
					input cin, // carry in
					output reg out,  //output
					output reg cout);  //carry out
					
	always @(a,b,cin)
	begin
		out <= a^b^cin;   //out = a xor b xor cin
		cout <= (a&b) | (b&cin) | (a&cin);  //cout = ab+bc+ac
	end
endmodule