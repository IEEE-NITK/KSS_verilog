/*
Mod 2 counter
Used to calulate the location of address in instruction memory
Facilitates sequential execution of instruction

INPUT : clk - input clock
        en - used to enable the counter. It remains 1 for this simulation
		rst - when reset counter comes to 0. Also used to initialize counter to 0
OUTPUT : count - provides the location on instruction to instruction memory

*/


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
		