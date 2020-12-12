/*
Stores the instruction that need to be encoded in encoded format (encoding scheme present in top module comments)
INPUT : pc - location of instruction to be executed. connected to the output of counter
OUPUT : inst - instruction in 8 bit encoded format

FOR SIMULATION : We have filled the intruction memory with 2 instructions
				    00100100  :  AND the values stored in Reg_location 1 and 0 and store the results in Reg_location 2
                    01110100  :  OR the values stored in Reg_location 1 and 0 and store the results in Reg_location 3	

*/


module inst_mem(input pc,
				output [7:0] inst);
				
	reg [7:0] inst_reg[1:0];
	initial
	begin
		inst_reg[0]<=8'b00100100;
		inst_reg[1]<=8'b01110100;
	end
	
	assign inst = inst_reg[pc];

endmodule