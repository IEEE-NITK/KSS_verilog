`timescale 1ns/1ns

module counter_tb();

reg clk_tb = 0;
reg rst_n_tb = 0;
reg [3:0]data_tb = 4'b0000;
reg load_tb = 0;
reg en_tb = 1;
wire [3:0]count_tb;
reg [3:0] check;
integer i;

counter_4bit u_counter_4bit(.clk(clk_tb),
			 .rst_n(rst_n_tb),
			 .en(en_tb),
			 .load(load_tb),
			 .d(data_tb),
			 .count(count_tb));
			 
	
always
	begin
		clk_tb=1'b1;
		#(25);
		clk_tb=1'b0;
		#(25);
	end
	
initial
	begin
		rst_n_tb=1'b0;
		#(10);
		rst_n_tb=1'b1;
	end
	
initial
	begin
		check = 4'b0000;
		for(i=0;i<16;i=i+1)
		begin
			@(negedge clk_tb)
			if(count_tb!=check)
				$display("%d . count = %b , check = %b , code failure",i,count_tb,check);
			else
				$display("%d . count = %b , check = %b , code passed",i,count_tb,check);
			check=check+1;
		end
	end
	
endmodule