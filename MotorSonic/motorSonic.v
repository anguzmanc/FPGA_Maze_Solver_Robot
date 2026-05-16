module motorSonic
 (input i_Reset,
  input i_Clk,
  input i_sonic_izq,
  input i_sonic_der,
  output normal,
  output giro_izq,
  output giro_der);
  localparam s0 = 2'b00; //Normal (ir derecho)
  localparam s1 = 2'b01; //Giro Derecha
  localparam s2 = 2'b10; //Giro Izquierda
  reg [1:0] r_Estado_Actual;
  
  always @(posedge i_Clk or posedge i_Reset)
  begin
    if (i_Reset)
      r_Estado_Actual <= s0;
    else
    begin
      case (r_Estado_Actual)
        s0:
          if (i_sonic_izq == 1 & i_sonic_der == 1)
            r_Estado_Actual <= s0;
        else if (i_sonic_izq == 1 & i_sonic_der == 0)
            r_Estado_Actual <= s1;
        else if (i_sonic_izq == 0 & i_sonic_der == 1)
            r_Estado_Actual <= s2;
        else if (i_sonic_izq == 0 & i_sonic_der == 0)
            r_Estado_Actual <= s0;

        s1:
          if (i_sonic_izq == 1 & i_sonic_der == 1)
            r_Estado_Actual <= s0;
        else if (i_sonic_izq == 1 & i_sonic_der == 0)
            r_Estado_Actual <= s1;
        else if (i_sonic_izq == 0 & i_sonic_der == 1)
            r_Estado_Actual <= s2;
        else if (i_sonic_izq == 0 & i_sonic_der == 0)
            r_Estado_Actual <= s0;

        s2:
          if (i_sonic_izq == 1 & i_sonic_der == 1)
            r_Estado_Actual <= s0;
        else if (i_sonic_izq == 1 & i_sonic_der == 0)
            r_Estado_Actual <= s1;
        else if (i_sonic_izq == 0 & i_sonic_der == 1)
            r_Estado_Actual <= s2;
        else if (i_sonic_izq == 0 & i_sonic_der == 0)
            r_Estado_Actual <= s0;
      endcase
    end
  end
  assign normal = (r_Estado_Actual == s0);
  assign giro_der = (r_Estado_Actual == s1);
  assign giro_izq = (r_Estado_Actual == s2);
endmodule