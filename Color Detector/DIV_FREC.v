module DIV_FREC #(parameter FRECUENCIA = 16666666)(CLK, CLK2);
	input CLK;
	output CLK2;
	
	reg [32:0] COUNT = 0;
	reg CLK_N = 1'b0;
	
	always @(posedge CLK)
	begin
		if(COUNT == FRECUENCIA-1)
			begin
			COUNT = 0;
			CLK_N = ~CLK_N;
			end
		else 
			begin
			COUNT = COUNT + 1;
			end
	end
	assign CLK2 = CLK_N;

endmodule