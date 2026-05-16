`timescale 1ns/1ns
`include "pwm.v"

module pwm_tb;
    integer i;
    reg clk = 0;
    wire [3:0] led;
    pwm uut(clk, led);
  initial begin
  
	$dumpfile("pwm.vcd");
	$dumpvars(0,pwm_tb);

  for(i=0; i<1000; i = i+1) begin
        clk = ~clk;
        #10; //Tiempo total del testbech 10 ns
    end

	$display("Test Finished uwu");
	$finish;
  end
endmodule