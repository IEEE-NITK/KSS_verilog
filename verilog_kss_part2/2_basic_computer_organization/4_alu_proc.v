/*
ALU takes ALU operation code from instruction decoder and operands from regiter files 
and executes the operation as follows

op = 00 : out = in1 AND in2
op = 01 : out = in1 OR in2
op = 10 : out = in1 XOR in2
op = 11 : out = complement of in1 (the operand in2 is ignored in this case)
*/




module alu_proc(input [1:0]op,
				input [7:0]in1,
				input [7:0]in2,
				output [7:0]out,
				output write_reg);
				
	reg [7:0]out_temp;
	
	assign out=out_temp;
	assign write_reg=1'b1;
	always @(op,in1,in2,out)
	begin
		case(op)
			2'b00: out_temp<=in1&in2;
			2'b01: out_temp<=in1|in2;
			2'b10: out_temp<=in1^in2;
			2'b11: out_temp<=~in1;
			default : out_temp<=8'b00000000;
		endcase
	end
endmodule
			
				