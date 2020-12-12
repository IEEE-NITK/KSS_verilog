module current_state_logic(input clk,
                           input rst_n,
						   input [1:0] next_state,
						   output reg [1:0] current_state);

always @(posedge(clk))
begin
	if(rst_n == 1'b0)
		current_state<=2'b00;
	else
		current_state<=next_state;
end

endmodule