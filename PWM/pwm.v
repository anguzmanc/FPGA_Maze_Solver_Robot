`timescale 1ns/1ns

module pwm (
    input clk,
    output [3:0] led //Se usan leds para ver si funciona el codigo correctamente
);
//Contador para hacer un comparador mas adelante

reg [6:0] contador = 0; //log_2(100) = 6.64 aprox 7
always @(posedge clk) begin
    if (contador < 100)
        contador <= contador + 1;
    else contador <= 0; // resetear contador 
end

//20% ciclo de trabajo (duty cycle)
assign led[0] = (contador < 20) ? 1:0; //Si el contador es menor a 20 se la asigna valor de 1 al led, sino se le asigna 0

//40% ciclo de trabajo (duty cycle)
assign led[1] = (contador < 40) ? 1:0;

//60% ciclo de trabajo (duty cycle)
assign led[2] = (contador < 60) ? 1:0;

//80% ciclo de trabajo (duty cycle)
assign led[3] = (contador < 80) ? 1:0;    
endmodule