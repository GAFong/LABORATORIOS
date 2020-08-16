//GABRIEL ALEXANDER FONG PENAGOS
//CARNE 19722
//ELECTRONICA DIGITAL
//LABORATORIO 05
// MUXES
module MUX2_1(input wire A, B, C, output wire Y);                                // CEAMOS EL MODLO PARA EL MUX 2:1       A es el selector, B Y C SON INPUTS

  assign Y = A?C:B;                                                             //USAMOS EL OPERADOR TERNARIO ?, EL CUAL SELECCIONA QUIEN LE DARA EL VALOR A Y

endmodule

module MUX4_1(input wire  A, B, C, D, input wire[1:0]S, output wire Y);         //CREAMOS EL MODULO PARA EL MUX 4:1, SE UTILIZAN 3 MUX 2:1 PARA CREARLO
                                                                                //S PUEDE SER 1 O 0, SE AGREGA EL VALOR ADENTRO DE CORCHETESS,EL CUAL SELECCIONA LA POSICION DE LOS BITS
  wire OUT1, OUT2;

  MUX2_1 mux1(S[0], A, B, OUT1);                                                //UTILIZAMOS EL MUX 2:1 PARA SELECCIONAR CUAL DE LAS 2 ENTRADAS DARA EL VALOR DE SALIDA
  MUX2_1 mux2(S[0], C, D, OUT2);                                                //UTILIZAMOS EL MUX 2:1 PARA SELECCIONAR CUAL DE LAS ULTIMAS 2 ENTRADAS DARA EL VALOR DE SALIDA
  MUX2_1 mux3(S[1], OUT1, OUT2, Y);                                             //UTILIZAMOS EL MUX 2:1 PARA SELECCIONAR CUAL DE LOS DOS MUXES ANTERIORES DARA EL VALOR DE SALIDA

endmodule

module MUX8_1(input wire A, B, C, D, E, F, G, H, input wire [2:0] S, output wire Y); //CREAMOS EL MODULO PARA EL MUX 8:1 SE UTILIZAN 2 MUX 4:1 Y 1 MUX 2:1
                                                                                    // S PUEDE SER 2, 1, 0
  wire OUT1, OUT2;

  MUX4_1 mux1(A, B, C, D, S[1:0], OUT1);                                        //UTILIZAMOS EL MUX 4:1 PARA SELECCIONAR CUAL DE LAS 4 ENTRADAS DARA EL VALOR DE SALIDA
  MUX4_1 mux2(E, F, G, H, S[1:0], OUT2);                                        //UTILIZAMOS EL MUX 4:1 PARA SELECCIONAR CUAL DE LAS SIGUIENTES 4 ENTRADAS DARA EL VALOR DE SALIDA
  MUX2_1 mux3(S[2], OUT1, OUT2, Y);                                             //UTILIZAMOS EL MUX 2:1 PARA SELECCIONAR CUAL DE LOS DOS MUXES 4:1 ANTERIORES DARA EL VALOR
                                                                                //TENER EN CUENTA QUE COLOCAMOS QUE EN EL MUX 4:1, SE INGRESAN DE PRIMERO LAS 4 ENTRADAS Y DESPUES EL selector
endmodule                                                                       //EN EL MUX 2:1 SE COLOCA DE PRIMERO EL SELECTOR Y LUEGO LAS 2 ENTRADAS

module t1_mux2_1(input wire A, B, C, output wire Y);                            //CREAMOS EL MODULO TABLA 1 CON MUX 2:1 A ES SELECTOR
                                                                                //A SERA NUESTRO SELECTOR.  B Y C SERAN LOS QUE DEFINAN EL VALOR DE SALIDA
  wire RES1, RES2;
  assign RES1 = (B^C);                                                          //REALIZAMOS XOR PARA OBTENER LOS VALORES CUANDO A = 0
  assign RES2 = ~(B^C);                                                         //REALIZAMOS XNOR PARA OBTENER LOS VALORES CUANDO A = 1

  MUX2_1 U1(A, RES1, RES2, Y);                                                  //UTILIZAMOS EL MUX 2:1 PARA TERMINAR DE REALIZAR LA TABLA 1

endmodule

module t1_mux4_1(input wire A, B, C, output wire Y);                            //CREAMOS EL MODULO TABLA 1 CON MUX 4:1    A Y B SON SELECTORES
                                                                                //A SERA NUESTRO SELECTOR DE LA SEGUNDA CIFRA Y B DE LA PRIMER CIFRA DE  Y C SERA EL QUE DEFINA EL VALOR DE SALIDA
  wire [1:0]S;
  assign S[0] = B;                                                              //LE ASIGNAMOS LA POSICION A NUESTROS SELECTORES
  assign S[1] = A;
  MUX4_1 U2(C, ~C, ~C, C,S[1:0], Y);                                            //UTILIZAMOS EL MUX 4:1 PARA TERMINAR DE REALIZAR LA TABLA 1
endmodule

module t1_mux8_1(input wire A, B, C, GND, VCC, output wire Y);                  //CREAMOS EL MODULO TABLA 1 CON MUX 8:1    A B C  SON SELECTORES
  wire [2:0]S;                                                                  // VCC Y GND DEFINIRAN LOS VALORES DE SALIDA, SIENDO GND 0 Y VCC 1
  assign S[0] = C;                                                              //ASIGNAMOS LAS POSICIONES DE LOS SELECTORES
  assign S[1] = B;
  assign S[2] = A;
  MUX8_1 U3(GND, VCC, VCC, GND, VCC, GND, GND, VCC, S[2:0], Y);                 //UTILIZAMOS EL MUX 8:1 PARA TERMINAR DE REALIZAR LA TABLA 1
endmodule

module t2_mux2_1(input wire A, B, C, output wire Y);                            //CREAMOS EL MODULO TABLA 2 CON MUX 2:1 A ES SELECTOR
                                                                                //A SERA NUESTRO SELECTOR.  B Y C SERAN LOS QUE DEFINAN EL VALOR DE SALIDA
  wire RES1, RES2;
  assign RES1 = ~(B | C);                                                       //REALIZAMOS NOR PARA OBTENER LOS VALORES CUANDO A = 0
  assign RES2 = ~(B & C);                                                       //REALIZAMOS NAND PARA OBTENER LOS VALORES CUANDO A = 1
  MUX2_1 U3(A, RES1, RES2, Y);                                                  //UTILIZAMOS EL MUX 2:1 PARA TERMINAR DE REALIZAR LA TABLA 2
endmodule

module t2_mux4_1(input wire A, B, C, GND, output wire Y);                       //CREAMOS EL MODULO TABLA 2 CON MUX 4:1    A Y B SON SELECTORES
                                                                                //A SERA NUESTRO SELECTOR DE LA SEGUNDA CIFRA Y B DE LA PRIMER CIFRA DE  Y C Y GND SERAN LOS QUE DEFINA EL VALOR DE SALIDA
  wire [1:0]S;
  assign S[0] = B;                                                              //ASIGNAMOS LA POSISICION A NUESTROS SELECTORES
  assign S[1] = A;
  MUX4_1 U5(~C, GND, C, ~C, S[1:0], Y);                                         //UTILIZAMOS EL MUX 4:1 PARA TERMINAR DE REALIZAR LA TABLA 2
endmodule

module t2_mux8_1(input wire A, B, C, GND, VCC, output wire Y);                  //CREAMOS EL MODULO TABLA 1 CON MUX 8:1    A B C  SON SELECTORES
  wire [2:0]S;                                                                  // VCC Y GND DEFINIRAN LOS VALORES DE SALIDA, SIENDO GND 0 Y VCC 1
  assign S[0] = C;                                                              //ASIGNAMOS LAS POSICIONES DE LOS SELECTORES
  assign S[1] = B;
  assign S[2] = A;
  MUX8_1 U6(VCC, GND, GND, GND, GND, VCC, VCC, GND, S[2:0], Y);                 //UTILIZAMOS EL MUX 8:1 PARA TERMINAR DE REALIZAR LA TABLA 2
endmodule
