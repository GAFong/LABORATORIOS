//ALARMA CARRO
//GABRIEL ALEXANDER FONG PENAGOS
//CARNE 19722
//LABORATORIO 04
//EJERCICIO 05 MODULOS 

  module alarma_sopg(input wire A, B, C, output wire Y1);                        //Creamos el modulo de Alarma con configuracion SOP y gate leveling

    wire notA, notB, notC, w1, w2 ,w3;                                          //Creamos nuestros cables
    //Compuertas NOT
    not (notA, A);
    not (notB, B);
    not (notC, C);
    //operaciones
    and (w1, A, notB, notC);
    and (w2, A, notB, C);
    and (w3, A, B, C);
    or  (Y1, w1, w2, w3);

  endmodule                                                                     //Terminamos el modulo alarma_sop

  module alarma_sopo(input wire A, B, C, output wire Y2);                       //Creamos el modulo de Alarma con configuracion SOP y BM

      assign Y2 = (A & ~B & ~C) | (A & ~B & C) | (A & B & C);
  endmodule

  module alarma_poso(input wire A, B, C, output wire Y3);                       //Creamos el modulo de Alarma con configuracion POS y BM

    assign Y3 = (A|B|C) & (A|B|~C) & (A|~B|C) & (A|~B|~C) & (~A|~B|C);

  endmodule

  module alarma_posg(input wire A, B, C, output wire Y4);                       //Creamos el modulo de Alarma con configuracion POS y gate leveling

    wire notA, notB, notC, w1, w2 , w3, w4, w5;                                 //Creamos nuestros cables
    //COMPUERTAS NOY
    not (notA, A);
    not (notB, B);
    not (notC, C);
    //operaciones
    or  (w1, A, B, C);
    or  (w2, A, B, notC);
    or  (w3, A, notB, C);
    or  (w4, A, notB, notC);
    or  (w5, notA, notB, C);
    and (Y4, w1, w2, w3, w4, w5);

  endmodule

  module alarma_ko(input wire A, B, C, output wire Y5);                         //Creamos el modulo de Alarma con configuracion simplificada de KARNAUGH y BM

    assign Y5 = (A & C) | (A & ~B);

  endmodule

  module alarma_kg(input wire A, B, C, output wire Y6);                         //Creamos el modulo de Alarma con configuracion simplificada de KARNAUGH y GATELEVELM

    wire notB, w1, w2;

    not (notB, B);

    and (w1, A, C);
    and (w2, A, notB);
    or  (Y6, w1, w2);
  endmodule
