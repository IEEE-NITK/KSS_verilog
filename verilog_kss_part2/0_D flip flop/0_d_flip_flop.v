/*
Simulation of basic D flip flop

INPUT : -clk to the flip flop
        -rst_n : make the output of d flip flop zero
		-d : The value of d tobe entered
		
OUTPUT : q : output of d flip flop

TO SIMULATE USE:
clk    : time period : 100ns, duty cycle:50%
rst_n  : 1
d      : use a clock with appropriate duty cycle and time period
*/



module d_flip_flop(input clk,
				   input rst_n, //asynchronous neg edge reset
			       input d,
				   output reg q);
				   
	always @(posedge clk,negedge rst_n)
	begin
		if(rst_n==0)
		begin
			q<=1'b0;
		end
		else
		begin
			q<=d;
		end
	end
endmodule