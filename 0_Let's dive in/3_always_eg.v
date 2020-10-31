module always_eg(output reg [2:0]val);

reg temp;

initial
begin
temp = #100 1'b0; //assigning temp only after 100ns
end

always @(temp)  //always block dependent on temp
begin
	val <= 3'b100;
end
endmodule


