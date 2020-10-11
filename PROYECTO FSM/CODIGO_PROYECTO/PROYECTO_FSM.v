//PROYECTO MAQUINA DE ESTADOS FINITOS
//ELECTRONICA DIGITAL
//OCTUBRE DE 2020
//GABRIEL ALEXANDER FONG PENAGOS 19722
//FSM

//CREAMOS MODULO FLIP FLOP TIPO D, DE 2 BITS
module flipflopD(input wire clk, reset,
                input wire D,
                output reg Q);                  //COLOCAMOS NUESTRA SALIDA COMO REG
  always @(posedge clk, posedge reset) begin   //COLOCAMOS ALWAYS PARA QUE SIEMPRE SE PUEDA REALIZAR LA FUNCION
    if(reset) begin
      Q <= 1'b0;                              //COLOCA LA SALIDA CON VALOR 0
    end
    else
      Q <= D;                                 //COLOCA EN LA SALIDA EL VALOR QUE TENGA D
    end
endmodule

module antirebote(input wire BF,clk, reset,
                  output wire BI);
      wire S;
      flipflopD U1(clk, reset, BF, S);
      assign BI = (~S & BF);
endmodule

module FSM1(input wire clk, reset, L, U, P, ST, ON,
            output wire PP, PS, M, F,
            output wire [1:0]TA,
            output wire [2:0]SA,
            output wire [2:0]SF); //SA = ESTADO ACTUAL, SF = ESTADO FUTURO

      wire S2, S1, S0;
      //REALIZAMOS LAS ECUACIONES PARA LOS ESTADOS FUTUROS
      assign SF[2] = (S2 & ST & ON)|(S1 & S0 & ST & ON);
      assign SF[1] = (S2 & ~ST) | (S2 & ~ON) | (S1 & ~S0 & ST) | (S1 & S0 & ~ST) | (~S1 & S0 & L & ~U) | (~S2 & ~S1 & P) | (~S2 & ~S0 & P) | (S1 & L & ~ST) | (S1 & ~U & ~ST) |(S1 & ST & ~ON);
      assign SF[0] = (S2 & ST & ~ON) | (S1 & ~S0 & ~L & ST) | (S1 & ~S0 & ~U & ST) | (S1 & S0 & ST & ~ON) | (~S1 & S0 & L & U & ~P) | (S1 & ~S0 & ~L & U & ~P)| (~S1 & S0 & ~L & ~U & ~P) | (~S2 & ~S1 & ~S0 & L & ~U & ~P);
      //REALIZAMOS LAS CONEXIONES PARA NUESTROS FLIP FLOP PARA ESTADOS ACTUALES
      flipflopD U1(clk, reset,SF[2], S2);
      flipflopD U2(clk, reset,SF[1], S1);
      flipflopD U3(clk, reset,SF[0], S0);

      assign SA[2] = S2;
      assign SA[1] = S1;
      assign SA[0] = S0;
      //REALIZAMOS LAS ECUACIONES PARA LAS SALIDAS
      assign PP = (~S2 & S1) | (S2 & ~S1 & ~S0);
      assign PS = (~S2 & S1) | (~S2 & S0) | (S2 & ~S1 & ~S0);
      assign TA[1] = (~S2 & S1) | (S2 & ~S1 & ~S0);
      assign TA[0] = (~S2 & S0) | (S2 & ~S1 & ~S0);
      assign M = (~S2 & S1 & S0) | (S2 & ~S1 & ~S0);
      assign F = (S2 & ~S1 & ~S0);
endmodule

module FSM2(input wire clk, reset, SE,
            input wire [2:0]BE,
            output wire P, ME,
            output wire [1:0]A,
            output wire [1:0]SR,
            output wire [1:0]PO,
            output wire [2:0]SA,
            output wire [2:0]SF);

      wire S2, S1, S0, BE2, BE1, BE0;
      assign BE2 = BE[2];
      assign BE1 = BE[1];
      assign BE0 = BE[0];
      //REALIZAMOS LAS ECUACIONES PARA LOS ESTADOS FUTUROS
      assign SF[2] = (S2 & BE2) | (BE2 & ~BE1) | (~S1 & ~S0 & BE2 & SE) | (S2 & S1 & BE1 & SE) | (S2 & S1 & ~BE0 & SE) | (~S2 & ~S1 & ~S0 & ~BE1 & ~BE0 & SE);
      assign SF[1] = (S1 & BE1) | (~BE2 & BE1) | (~S2 & ~S0 & BE1 & SE) | (S2 & S1 & ~BE0 & SE) | (~S2 & ~S1 & ~S0 & ~BE2 & ~BE0 & SE);
      assign SF[0] = (~BE1 & BE0) | (S0 & BE2 & BE1) | (~S2 & ~BE2 & BE0) | (~S1 & ~BE2 & BE0) | (~BE2 & BE0 & ~SE);
      //REALIZAMOS LAS CONEXIONES DE LOS FLIP FLOPS PARA LOS ESTADOS ACTUALES
      flipflopD U1(clk, reset, SF[2], S2);
      flipflopD U2(clk, reset, SF[1], S1);
      flipflopD U3(clk, reset, SF[0], S0);

      assign SA[2] = S2;
      assign SA[1] = S1;
      assign SA[0] = S0;

      //REALIZAMOS LAS ECUACIONES PARA LAS SALIDAS
      assign A[1] =(~S2 & S0);
      assign A[0] = S1;
      assign SR[1] = (~S2 & S1);
      assign SR[0] = (S2 & S1) | (~S2 & S0);
      assign P = (S2 & S1) | (~S1 & S0);
      assign PO[1] = (S2 & ~S1);
      assign PO[0] = (S2 & S1) | (~S2 & ~S1 & S0);
      assign ME = (~S1 & S0) | (~S2 & S1 & ~S0);
endmodule
