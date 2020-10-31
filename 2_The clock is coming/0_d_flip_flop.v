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