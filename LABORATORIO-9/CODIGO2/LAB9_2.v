//LABORATORIO 9
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 2

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

module flipflopT(input wire clk, reset, enable,
                output wire Q);

    wire D;
    not U1(D,Q); // TOMAMOS EL VALOR DE LA SALIDA Y XOR CON 1
    //SE UTILIZO LA XOR POR LA TABLA DE VERDAD, CUANDO EL DATO DE LA ENTRADA ES EL MISMO = 0, DIFERENTES = 1
    flipflopD U1(clk, reset, enable, D, Q);

endmodule
