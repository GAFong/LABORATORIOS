



module MUX2_1(input wire A, B, C, output wire Y); //A es el selector, B Y C SON INPUTS

  assign Y = A?C:B;

endmodule

module MUX4_1(input wire  A, B, C, D, input wire[1:0]S, output wire Y); // S PUEDE SER 1 O 0, SE AGREGA EL VALOR ADENTRO DE CORCHETES

  wire OUT1, OUT2;

  MUX2_1 mux1(S[0], A, B, OUT1);
  MUX2_1 mux2(S[0], C, D, OUT2);
  MUX2_1 mux3(S[1], OUT1, OUT2, Y);

endmodule

module MUX8_1(input wire A, B, C, D, E, F, G, H, input wire [2:0] S, output wire Y); // S PUEDE SER 2, 1, 0

  wire OUT1, OUT2;

  MUX4_1 mux1(A, B, C, D, S[1:0], OUT1);
  MUX4_1 mux2(E, F, G, H, S[1:0], OUT2);
  MUX2_1 mux3(S[2], OUT1, OUT2, Y);

endmodule

module t1_mux2_1(input wire A, B, C, output wire Y); // TABLA 1 CON MUX 2:1 A ES SELECTOR

  wire RES1, RES2;
  assign RES1 = (B^C);                              //REALIZAMOS XOR PARA OBTENER LOS VALORES CUANDO A = 0
  assign RES2 = ~(B^C);                             //REALIZAMOS XNOR PARA OBTENER LOS VALORES CUANDO A = 1

  MUX2_1 U1(A, RES1, RES2, Y);

endmodule

module t1_mux4_1(input wire A, B, C, output wire Y);
  wire [1:0]S;
  assign S[0] = B;
  assign S[1] = A;
  MUX4_1 U2(C, ~C, ~C, C,S[1:0], Y);
endmodule

module t1_mux8_1(input wire A, B, C, GND, VCC, output wire Y);
  wire [2:0]S;
  assign S[0] = C;
  assign S[1] = B;
  assign S[2] = A;
  MUX8_1 U3(GND, VCC, VCC, GND, VCC, GND, GND, VCC, S[2:0], Y);
endmodule

module t2_mux2_1(input wire A, B, C, output wire Y);

  wire RES1, RES2;
  assign RES1 = ~(B | C);
  assign RES2 = ~(B & C);
  MUX2_1 U3(A, RES1, RES2, Y);
endmodule

module t2_mux4_1(input wire A, B, C, GND, output wire Y);

  wire [1:0]S;
  assign S[0] = B;
  assign S[1] = A;
  MUX4_1 U5(~C, GND, C, ~C, S[1:0], Y);
endmodule

module t2_mux8_1(input wire A, B, C, GND, VCC, output wire Y);
  wire [2:0]S;
  assign S[0] = C;
  assign S[1] = B;
  assign S[2] = A;
  MUX8_1 U6(VCC, GND, GND, GND, GND, VCC, VCC, GND, S[2:0], Y);
endmodule
