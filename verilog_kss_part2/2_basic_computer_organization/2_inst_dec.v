/*
Instruction deocder takes in 8 bit instruction and gives output as :
op - ALU operation need to be executed
rd - Destination register location in reg file
rs,rs - Reg storing operand 1 and 2 for ALu operation

*/


module inst_dec(input [7:0]inst,
				output [1:0]rd,
				output [1:0]rs,
				output [1:0]rt,
				output [1:0]op);
				
	assign op = inst[7:6];
	assign rd = inst[5:4];
	assign rs = inst[3:2];
	assign rt = inst[1:0];
	
endmodule