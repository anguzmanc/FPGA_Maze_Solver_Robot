module MS (
    input i_reset,
    input i_clk,
    input i_sonic_izq,
    input i_sonic_cent,
    input i_sonic_der,
    output wire o_rueda_izq,
    output wire o_rueda_der,
    output wire o_reversa);
reg r_rueda_izq, r_rueda_der, r_reversa;
localparam s0 = 2'b00;
localparam s1 = 2'b01;
//localparam s2 = 2'b10;
//localparam s3 = 2'b11;
reg r_Estado_Actual, r_Estado_Siguiente;
// Estado Actual
always @(posedge i_clk or posedge i_reset)
begin
    if(i_reset)
    r_Estado_Actual <= s0;
    else
    r_Estado_Actual <= r_Estado_Siguiente;
end
//Estado Siguiente
always @(r_Estado_Actual or i_sonic_izq or i_sonic_cent or i_sonic_der)
begin
    r_Estado_Actual <= r_Estado_Siguiente;
case(r_Estado_Actual)
    s0:
        if(i_sonic_izq & ~i_sonic_cent & i_sonic_der)
            begin 
            r_rueda_izq = 1'b1;
            r_rueda_der = 1'b1;
            r_reversa = 1'b0;
            r_Estado_Siguiente <= s0;
            end
        else if((i_sonic_izq & ~i_sonic_cent & ~i_sonic_der) | (i_sonic_izq & i_sonic_cent & ~i_sonic_der) | ~(i_sonic_izq & i_sonic_cent & i_sonic_der))
           begin
            r_rueda_izq = 1'b1;
            r_rueda_der = 1'b0;
            r_reversa = 1'b0;
            r_Estado_Siguiente <= s1;
            end
        else if((~i_sonic_izq & i_sonic_cent & i_sonic_der) | (~i_sonic_izq & ~i_sonic_cent & i_sonic_der))
            begin
            r_rueda_izq = 1'b0;
            r_rueda_der = 1'b1;
            r_reversa = 1'b0;
            r_Estado_Siguiente <= s2;
            end 
        else if((i_sonic_izq & i_sonic_cent & i_sonic_der))
            begin
            r_rueda_izq = 1'b1;
            r_rueda_der = 1'b1;
            r_reversa = 1'b1;
            r_Estado_Siguiente <= s3;
            end 
    s1: 
        if(i_sonic_izq & i_sonic_cent & i_sonic_der)
            begin
            r_rueda_izq = 1'b1;
            r_rueda_der = 1'b1;
            r_reversa = 1'b1;
            r_Estado_Siguiente <= s3;
            end 
    s2: 
        if(i_sonic_izq & i_sonic_cent & i_sonic_der)
            begin
            r_rueda_izq = 1'b1;
            r_rueda_der = 1'b1;
            r_reversa = 1'b1;
            r_Estado_Siguiente <= s3;
            end 
    s3: 
        if(i_sonic_izq & ~i_sonic_der)
            begin
            r_rueda_izq = 1'b1;
            r_rueda_der = 1'b0;
            r_reversa = 1'b0;
            r_Estado_Siguiente <= s1;
            end 
        else if(~i_sonic_izq & i_sonic_der)
            begin
            r_rueda_izq = 1'b0;
            r_rueda_der = 1'b1;
            r_reversa = 1'b0;
            r_Estado_Siguiente <= s2;
            end 
endcase
end
assign o_rueda_izq = r_rueda_izq;
assign o_rueda_der = r_rueda_der;
assign o_reversa = r_reversa;
endmodule
//iverilog -g2012 -o TM_TB.vvp TM_TB.v