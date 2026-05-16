module top(
	input clk,
	input e,
	output trig,
	output rojo,
	output amarillo,
	output verde,
	output ledx
);
wire [19:0] ciclos;

trigger tr(clk,trig);
echo ech(e,clk,ciclos);
distancia dist(ciclos,rojo,amarillo,verde,ledx);

endmodule
