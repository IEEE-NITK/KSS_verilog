/*
The module is designed to calculate the next input of the state machine as a part of IEEE Verilog KSS
INPUTS :      In     :  0 : Re1 coin is placed by the user
                        1 : Rs2 coin is placed by the user
			 
		Current_state : Gives the current state of the state machine
		                (possible values : 00,01,10,11 (2 bits))

OUTPUT : Next_state    : Provide value of next state based on input abd current state  
						  (possible values : 00,01,10,11 (2 bits))
						  
Certain Assumptions : -clock is triggered only when coin is placed in the system 
                      -candy is released as soon as the Candy output becomes one
					  -system resets to original state as soon as return is given out
*/

module next_state_logic(input In,
                  input [1:0] current_state,
				  output reg [1:0] next_state);


always @(In,current_state)
begin
	case(current_state)
		2'b00 : if(In==1'b0)
					next_state<=2'b01;
				else
					next_state<=2'b10;
		2'b01 : if(In==1'b0)
					next_state<=2'b10;
				else
					next_state<=2'b11;
		2'b10 : if(In==1'b0)
					next_state<=2'b01;
				else
					next_state<=2'b10;
		2'b11 : if(In==1'b0)
					next_state<=2'b10;
				else
					next_state<=2'b11;
					
		default : next_state<=2'b00;
	endcase
end

endmodule