
/*
The module is designed to calculate the current state of the state machine as a part of IEEE Verilog KSS

Description of the Vending Machine (state diagram){one candy cost Rs2 and the candy gets dispatched as soon as it gets the commnad}
STATE DIAGRAM



					State0(Candy=0,Money Ret=0) ---------Rs2------> State2(Candy=1,Money Ret=0)<-------
					       |                                           |  ^       |    A               |
						   |  Re1         -----------Re1----------------  |       |    |               |Rs1
						   |              |                               |       |----|               |
						   V              V                               |          Rs2               |
                    State1(Candy=0,Money Ret=1)----------------Re1--------                State3(Candy=1,Money Ret=1)--------
					       |                                                                          ^          ^          | Rs2
						   |----------------------------------------------Rs2-------------------------|          |----------|
						   
						   
						   


INPUTS :      clk      :  Normal clock to the circuit
              
              In         :  0 : Re1 coin is placed by the user
                            1 : Rs2 coin is placed by the user
						
			  rst_n      :  0 : reset incative 
                            1 : reset_active
			 
		Current_state    : Gives the current state of the state machine
		                  (possible values : 00,01,10,11 (2 bits))

         Next_state      : Provide value of next state based on input abd current state  
						  (possible values : 00,01,10,11 (2 bits))
						  
OUTPUTS :      candy     : No of candy given as output
               money_ret : Change money given out
						  
Certain Assumptions : 					-candy is released as soon as the Candy output becomes one
(Not Implemented in the design)			-system resets to original state as soon as return is given out
*/



module top_module(input clk,
				  input rst_n,
				  input In,
				  output candy,
				  output money_ret);
				  
wire [1:0]current_state;
wire [1:0]next_state;
	
	//Calculating next state
	next_state_logic u_next_state_logic(.In(In),
	                                    .current_state(current_state),
										.next_state(next_state));
									
									
	//Calculating current state
	current_state_logic u_current_state_logic(.clk(clk),
	                                          .rst_n(rst_n),
											  .next_state(next_state),
											  .current_state(current_state));
											  
	//Calculating Output
	output_logic u_output_logic(.current_state(current_state),
	                            .candy(candy),
								.money_ret(money_ret));
								
endmodule