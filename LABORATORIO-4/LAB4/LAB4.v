//GABRIEL ALEXANDER FONG PENAGOS
//CARNE 19722
//LABORATORIO 04

  module gl1_1(input wire A, B, C, output wire Y1);                               //Creamos el modulo para EJERCICIO 1. INCISO 2 EN GATELEVEL
    wire notA, notB, notC, w1, w2, w3;
                                                                                  //Creamos las entradas negadas con la compuerta not
    not (notA, A);
    not (notB, B);
    not (notC, C);
                                                                                  //Realizamos las operaciones con las compuertas para el modulo
    and (w1, A, C);
    and (w2, A, notB);
    and (w3, notA, notC);
    or  (Y1, w1, w2, w3);

    endmodule                                                                     //Terminamos el modulo para el EJERCICIO 1. INCISO 1 EN GATELEVEL


  module gl1_2(input wire A, B, C, output wire Y2);                               // Creamos el modulo para EJERCICIO 1. INCISO 2 EN GATELEVEL

    not(Y2, B);                                                                   //En este modulo solo se necesita negar la entrada B

    endmodule                                                                     //Terminamos el modulo para el EJERCICIO 1. INCISO 2 EN GATELEVEL

  module op1_3(input wire A, B, C, D, output wire Y3);                            // Creamos el modulo para EJERCICIO 1. INCISO 3 EN OPERADORES LÓGICOS

    assign Y3 = (~A & ~B & ~C & ~D) | (~A & ~B & C & D) | (~A & B & ~C & D) | (~A & B & C & ~D) | (A & B & ~C & ~D) | (A & B & C & D) | (A & ~B & ~C & D) | (A & ~B & C & ~D);

  endmodule

  module op1_4(input wire A, B, C, D, output wire Y4);

    assign Y4 = (A & B) | (A & ~C & ~D) | (A & C & D);

  endmodule

  module op2_1(input wire A, B, C, D, output wire Y5);

    assign Y5 = (A & ~C) | (~B & ~C & ~D) | (A & ~D) | (A & ~B);

  endmodule

  module gl2_2(input wire A, B, C, output wire Y6);

    wire notB;

    not (notB, B);
    or  (Y6, notB, C);

  endmodule

  module op2_3(input wire A, B, C, D, output wire Y7);

    assign Y7 = B | (~C & D) | (A & D);

  endmodule

  module gl2_4(input wire A, B, C, output wire Y8);

    wire notA, notC, w1;

    not (notA, A);
    not (notC, C);
    and (w1, notA, notC);
    or  (Y8, w1, B);

  endmodule
