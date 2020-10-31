module proc_top_module(input clk,
					   input en_count,
					   input rst_count,
					   input mem_rst,
					   output [7:0]reg2,
					   output [7:0]reg3);
					   
	wire pc;
	wire [7:0]inst;
	wire [1:0]rd;
	wire [1:0]rs;
	wire [1:0]rt;
	wire [7:0]alu_in1;
	wire [7:0]alu_in2;
	wire [1:0]alu_op;
	wire en_reg = 1'b1;
	wire [7:0]alu_res;
	
	
	
	
	
	//calculating program counter value
	counter u_counter(.clk(clk),
					  .en(en_count),
					  .rst(rst_count),
					  .count(pc));
					  
	//Getting the instruction from instruction memory
	inst_mem u_inst_mem(.pc(pc),
						.inst(inst));
						
	//decoding the instruction
	inst_dec u_inst_dec(.inst(inst),
						.rd(rd),
						.rs(rs),
						.rt(rt),
						.op(alu_op));
						
	//reading and writing values in reg file
	reg_file u_read_reg_file(.clk(clk),
						.rst(mem_rst),
						.write_en(en_reg),
						.reg_write_add(rd),
						.reg_write_data(alu_res),
						.reg_read_add1(rs),
						.reg_read_add2(rt),
						.reg_read_data1(alu_in1),
						.reg_read_data2(alu_in2),
						.reg2(reg2),
						.reg3(reg3));
						
	//calculating result
	alu_proc u_alu_proc(.op(alu_op),
						.in1(alu_in1),
						.in2(alu_in2),
						.out(alu_res),
						.write_reg(write_reg));
						

endmodule