`include "motorSonic.v"
`timescale 1 ns / 1 ns

module motorSonic_tb();

  reg r_Reset = 1'b1, r_Clk = 1'b0, r_sonic_izq = 1'b0, r_sonic_der = 1'b0;
  wire w_normal, w_giro_izq, w_giro_der;

    motorSonic UUT
   (.i_Reset(r_Reset),
    .i_Clk(r_Clk), 
    .i_sonic_izq(r_sonic_izq),
    .i_sonic_der(r_sonic_der),
    .normal(w_normal),
    .giro_izq(w_giro_izq),
    .giro_der(w_giro_der));
  
  always #1 r_Clk <= !r_Clk;

  initial begin
    $dumpfile("motorSonic_tb.vcd"); 
    $dumpvars;
    #10;
    r_Reset <= 1'b0;
    #10;
    assert (w_normal == 1'b1);
    r_sonic_izq <= 1'b0;
    r_sonic_der <= 1'b1;
    #10;
    assert (w_giro_der == 1'b1);
    r_sonic_izq <= 1'b1;
    r_sonic_der <= 1'b1;
    #10;
    assert (w_giro_izq == 1'b1);
    r_sonic_izq <= 1'b1;
    r_sonic_der <= 1'b0;
    #10;
    assert (w_giro_izq == 1'b1);
    r_sonic_izq <= 1'b0;
    r_sonic_der <= 1'b0;
    #10;
    assert (w_giro_der == 1'b1);
    r_sonic_izq <= 1'b1;
    r_sonic_der <= 1'b0;
    #10;
    assert (w_giro_der == 1'b1);
    r_sonic_izq <= 1'b1;
    r_sonic_der <= 1'b1;
    #10;
    assert (w_normal == 1'b1);
    $finish();
  end
endmodule
//iverilog -g2012 -o TM_TB.vvp TM_TB.v