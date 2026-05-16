module trigger(
	input clk_in,
	output reg pulse=0
);

//Como tiempo LIMIT 20ms
parameter SIZE = 20; //log_2(500000)=18.93=19
parameter LIMIT = 20'd500000; //Limit= 25MHz/(1/20ms)=500000

reg [SIZE-1:0] count = 0;

always@(posedge clk_in)
	begin
		 if(count<LIMIT)
			begin
				count = count+1;
				pulse = 1;
 //Se va a ir llenando un contador mientras el tiempo de 20ms en que el ultrasonido actua va emitiendo la señal de ultrasonido para que revote con la superficie que tenga al frente
			end
		else
			begin
				pulse = 0;
				count = 0;
			end
		
	end
endmodule
