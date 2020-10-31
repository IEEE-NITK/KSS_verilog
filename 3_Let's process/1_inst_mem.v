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