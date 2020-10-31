module or_and_imp_modules(input in1,
						  input in2,
						  output and_out,
						  output or_out);
		
	and_imp u_and_imp(.in_1(in1),
					  .in_2(in2),
					  .out(and_out));

	
	or_imp u_or_imp(.in_1(in1),
					.in_2(in2),
					.out(or_out));
			   
endmodule