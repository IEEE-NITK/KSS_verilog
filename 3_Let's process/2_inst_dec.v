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