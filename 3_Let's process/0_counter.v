module counter(input clk,
				input en,
				input rst, //negative edge trigered reset
				output reg count);
				
	always @(posedge clk, negedge rst)
	begin
		if(rst==0)
		begin
			count <= 1'b0;
		end
		else
		begin
		if(en==1)
			begin
			count <= count+1;
			end
		end
	end
	
endmodule
		