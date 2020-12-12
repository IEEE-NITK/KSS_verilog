/*
A simple unpopelined processor consists of the following part

1. Instruction Memory : -Here the encoded form of the instruction is stored
                        -The instruction in this processor are encoded in 8 bit format in the form
                        -bit(7,6) --> Details about operation to perform
                        -bit(5,4) --> Destination register, where results need to be stored
						-bit(3,2) --> Register containing ALU operand 1
						-bit(1,0) --> Register containing ALU operand 2
						(bit 7 : MSB, bit 0 : LSB)
						
2. Counter            : -The counter is responsible for giving out the adress of instruction to instruction memory
                        -It is responsible sequential execution of the instructions
						-Since we have only 2 memory location in our instruction memory we have made use of mod2 counter
						
3. Instruction Decoder: -Decoder deocdes the encoded instruction to give:
                               (i) Operation to be performed by ALU
                               (ii)Location of operand in register file
                               (iii)Destination in register file where results need to be stored

4. ALU                : -ALU or Arithmetic logic unit is used to carry out the operation in a processor
                        - ALU desined here can perform AND,OR,XOR and complement

5. Register file      : -It is a bank of register used to load and store values from and to main memory/cache
                      : -The register file in this module can store a total of 4 words(each of 8bits) at a time


In this module the following instructions are simulated
    00100100  :  AND the values stored in Reg_location 1 and 0 and store the results in Reg_location 2
    01110100  :  OR the values stored in Reg_location 1 and 0 and store the results in Reg_location 3	
	
	
	
INSTRUCTION TO SIMULATE
you can write a test bench or force the input in the following way
(i) set clk to a clock of time period 100ns and duty cycle as 50%
(ii) set en_count to 1
(iii) set rst_count to 0(active) for 25ns and 1(inactive) after that
(iv) set mem_rst to 1
(v) Run the simulation for 300ns
The output woud be AND and OR operation of values stored in reg_file on reg2 and reg3 observed during 2nd and 3rd cycle respectively

*/

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