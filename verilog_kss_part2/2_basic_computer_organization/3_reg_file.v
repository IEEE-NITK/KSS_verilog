/*
Register file stores the value of operand and results

-In this Simulation we are using 4X8 register file , which has 4 location ,each can store 1 word(8 bit)
-For Simulation purpose location 1 and 2 are already filled with some value using initial blocks

READING AND WRITNG
-Our register file has 2 read ports and 1 write ports
-Address to be read are given by reg_read_add1 and reg_read_add2
-reg_read_data1 and reg_read_data2 are the read port that outputs the read data to ALU
-The data to be written is sent in by reg_write data to be written in reg_write_add location
-it is written only when write en is set to 1

OBERSERVING THE OUTPUT
We have reg2 and reg3 ports to observe our simulation output as the output for out simulation are stored in this location
(There is no other use of them in actual processor)

RESET
rst can be used to set all the value of reg file to 0 (this functionality is not used in our simulation)
*/





module reg_file(input clk,
				input rst,
				input write_en,
				input [1:0] reg_write_add, //address to write in
				input [7:0] reg_write_data,
				input [1:0] reg_read_add1, //address to read from
				input [1:0] reg_read_add2, //address to read from
				output [7:0] reg_read_data1,
				output [7:0] reg_read_data2,
				output [7:0]reg2,
				output [7:0]reg3);
	

	reg [7:0] reg_arr[3:0];
	
	assign reg2 = reg_arr[2];
	assign reg3 = reg_arr[3];
	
	initial
	begin
		reg_arr[0]<=8'b10101010;
		reg_arr[1]<=8'b01010101;
	end
	
	always @(posedge clk, negedge rst)
	begin
		if(rst==0)
		begin
			reg_arr[0]<=8'b00000000;
			reg_arr[1]<=8'b00000000;
			reg_arr[2]<=8'b00000000;
			reg_arr[3]<=8'b00000000;
		end
		else
		begin
			if(write_en==1)
			begin
				reg_arr[reg_write_add]<=reg_write_data;
			end
		end
	end
	
	assign reg_read_data1 = reg_arr[reg_read_add1];
	assign reg_read_data2 = reg_arr[reg_read_add2];
	
endmodule
				
				