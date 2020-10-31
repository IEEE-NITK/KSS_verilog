module counter_4bit(input clk,
					input rst_n,
					input en,
					input load,
					input [3:0]d,
					output reg [3:0]count);
					
	always @(posedge clk,negedge rst_n)
	begin
		if(rst_n==0)
			count<=4'b0000;
		else
			if(load==1)
				count<=d;
			else
				if(en==1)
					count<=count+1;
	end
endmodule
				