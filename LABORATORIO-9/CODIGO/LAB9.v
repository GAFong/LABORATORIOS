//LABORATORIO 9
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 1

module flipflopD (input wire clk, reset, enable, D,
                  output reg Q);

    always @ ( posedge clk, posedge reset ) begin
      if (reset) begin
        Q <= 1'b0;
      end
      else if (enable) begin //SI EL ENABLE == 1 DEJA PASAR EL VALOR DE D A LA SALIDA Q
        Q <= D;
      end
    end
endmodule // flipflopD

module flipflop2D (input wire clk, reset, enable,
                  input wire [1:0]D,
                  output wire [1:0]Q);
    flipflopD U1(clk,reset, enable,D[0],Q[0]);//LLAMAMOS AL MODULO flipflopD
    flipflopD U2(clk,reset, enable,D[1],Q[1]);//LLAMAMOS AL MODULO flipflopD

endmodule // flipflop2D

module flipflop4D (input wire clk, reset, enable,
                  input wire [3:0]D,
                  output wire [3:0]Q);
    flipflop2D U1(clk, reset, enable,D[1:0], Q[1:0]);//LLAMAMOS AL MODULO FLIPFLOP 2 BITS
    flipflop2D U2(clk, reset, enable,D[3:2], Q[3:2]);//LLAMAMOS AL MODULO FLIPFLOP 2 BITS

endmodule // flipflop4D
