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
				
				