/*
General Description of the test bench

1. Timescale : - it is used to define the unit of all the input given in the test bench as well as the x axis unit on simulation time graph
               - The format is : value_unit/scale_unit

2. Instantiation of design under test : -We declare all the input and output test variable
                                        -Inputs are declared as datatype reg (as we have to keep changing value) and initialized to 0
                                        -Outputs are initialized as wires
										-The top module is instantiated as normal instantiation

3. Declaring clock  :  -clock of time period 100ns with duty cycle of 50% is used
                       -The Method declaring clock is shown below in code

4. Reset             : -We need to reset the output to state 0 before starting the operation					   
                       -To enable this reset is active for first 25ns and then made inactive indefinetly

5. Input             : -The test input are in pattern Re1,Re1,Rs2,Re1,Rs2 (0,0,1,0,1)
                     : -Input is changed after every 100ns

6. Display           : The Last part of the code is used to display relevant message on Message window

*/


`timescale 1ns/1ns

module fsm_test_bench();

reg clk_tb = 0;
reg reset_n_tb = 0;
reg In_tb = 0;
wire candy_tb;
wire money_ret_tb;

reg [4:0]test_inputs = 5'b00101;
integer i;
integer j;

//module instantiation
top_module u_top_module(.clk(clk_tb),
                        .rst_n(reset_n_tb),
						.In(In_tb),
						.candy(candy_tb),
						.money_ret(money_ret_tb));
						

//Declaring clock						
always
	begin
		clk_tb=1'b1;
		#(50);
		clk_tb=1'b0;
		#(50);
	end
	
//Declaring reset
initial
	begin
		reset_n_tb=1'b0;
		#(25);
		reset_n_tb=1'b1;
	end


//Declaring input	
initial
	begin
		for(j=4;j>=0;j=j-1)
		begin
			In_tb=test_inputs[j];
			#(100);
		end
	end
	
//Printing output results
initial
	begin
		for(i=0;i<5;i=i+1)
		begin
			@(negedge clk_tb)
			$display("Current output : Candy = %d, Money to Return = %d\n\tCoin Entered = %d",candy_tb,money_ret_tb,(In_tb+1));
		end
		@(negedge clk_tb)
		$display("Current output : Candy = %d, Money to Return = %d",candy_tb,money_ret_tb);
	end

endmodule