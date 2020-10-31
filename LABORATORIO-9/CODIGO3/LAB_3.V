//LABORATORIO 9
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 3

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

module flipflopJK (input wire clk, reset, enable, J, K,
                  output wire Q);
   wire Qn,Kn,w1,w2, w3;
   not U1(Qn, Q);
   not U2(Kn, K);
   nand U3(w1,Kn, Q);
   nand U4(w2,J, Qn);
   nand U5(w3, w1, w2);

   flipflopD U6(clk,reset,enable,w3,Q);
   endmodule//flipflopJK
