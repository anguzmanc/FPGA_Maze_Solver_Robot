`timescale 1ns / 1ns
`include "trigger.v"

module trigger_tb;
    integer i;
    reg clk = 0;
    wire pulse;

    trigger uut(.clk(clk),.pulse(pulse));
            initial begin
            $dumpfile("trigger.vcd");
            $dumpvars(0, trigger_tb);
              for(i=0; i<100; i = i+1) begin
            clk = ~clk;
            #100; //Tiempo total del testbech 10 ns
    end
            $display("Test Complete uwu");
        end

endmodule