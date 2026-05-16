module echo(
	input echo,
	input clk_in,
	output reg[19:0]ciclos
);
parameter SIZE=20;
reg [SIZE-1:0] count =0;

always@(posedge clk_in)
	begin
		if(echo==1)
			begin
				count=count+1; //Se va almacenando en un contador si el ultrasonido genera el echo
				ciclos=count;
			end
		else
			begin 
				count=0;
			end
	end
endmodule
