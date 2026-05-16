`include "MS.v"
`timescale 1ns/1ns

module MS_tb();
    reg reset = 1'b1, clk = 1'b0, sonic_izq = 1'b0, sonic_cent = 1'b0, sonic_der = 1'b0;
    wire rueda_izq, rueda_der, reversa;

MS UUT
(.reset(reset),
 .clk(clk),
 .sonic_izq(sonic_izq),
 .sonic_cent(sonic_cent),
 .sonic_der(sonic_der),
 .rueda_izq(rueda_izq),
 .rueda_der(rueda_der),
 .reversa(reversa)
);

always #1 clk <= !clk;

initial begin
    $dumpfile("MS_tb.vcd");
    $dumpvars;
    #10;
    reset <= 1'b0;
    #10;
    assert (rueda_izq == 1'b1);
    sonic_izq  <= 1'b1;
    sonic_cent <= 1'b0;
    sonic_der <= 1'b0;
    #10;
    assert (rueda_izq == 1'b0);
    sonic_izq  <= 1'b1;
    sonic_cent <= 1'b1;
    sonic_der <= 1'b0;
    assert (rueda_izq == 1'b1 and rueda_der == 1'b0);
    sonic_izq  <= 1'b1;
    sonic_cent <= 1'b0;
    sonic_der <= 1'b0;
    assert ( rueda_izq == 1'b0 and rueda_der == 1'b0);
    $finish();
end
endmodule
//iverilog -g2012 -o TM_TB.vvp TM_TB.v