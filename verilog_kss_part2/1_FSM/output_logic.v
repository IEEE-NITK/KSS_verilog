module output_logic(input [1:0]current_state,
					output reg candy,
					output reg money_ret);
					
always @(current_state)
begin
	case(current_state)
		2'b00 : 
		begin
				candy<=1'b0;
		        money_ret<=1'b0;
		end
		2'b01 : 
		begin
				candy<=1'b0;
		        money_ret<=1'b1;
		end
		2'b10 : 
		begin
				candy<=1'b1;
		        money_ret<=1'b0;
		end
		2'b11 : 
		begin
				candy<=1'b1;
		        money_ret<=1'b1;
		end
		default : 
		begin
				candy<=1'b0;
		        money_ret<=1'b0;
		end
	endcase
end

endmodule