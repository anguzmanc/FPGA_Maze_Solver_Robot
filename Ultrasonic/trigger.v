module trigger(
	input clk,
	output reg pulse=0
);

//Como tiempo LIMIT1 10us

parameter LIMIT1 = 9'd333; //Limit= 33.33MHz/(1/10us)=333
parameter SIZE1 = 9; // 10us/30ns=333.333 => log_2(333)=8.38=9


//Como tiempo LIMIT2 250ms

parameter LIMIT2 = 23'd8333333;
parameter SIZE2 = 23;


reg [1:0] count1 = 0;
reg [3:0] count2 = 0;

always@(posedge clk)
	begin
        if(count2<10)
        begin
            pulse = 0;
			count1 = 0;
            count2 = count2+1;
        end
        else
        begin
            if(count1<4)
			begin
                count2 = 0;
				count1 = count1+1;
				pulse = 1;
 //Se va a ir llenando un contador mientras el tiempo de 10us en que el ultrasonido
 //actua va emitiendo la señal de ultrasonido para que revote con la superficie que tenga al frente
			end 
        end		
	end
endmodule
