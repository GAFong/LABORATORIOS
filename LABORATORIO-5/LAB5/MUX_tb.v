//GABRIEL ALEXANDER FONG PENAGOS
//CARNE 19722
//ELECTRONICA DIGITAL
//LABORATORIO 05
//MUXES

module testbench ();

  wire GND;                                                                     //GND COMO CABLE Y LUEGO LE ASIGNAMOS DE VALOR 0
  wire VCC;                                                                     //VCC COMO GABLE Y LUEGO LE ASIGNAMOS DE VALOR 1
  assign GND = 0;
  assign VCC = 1;
  reg s1, in1B, in1C;                                                           //CREAMOS LOS REGISTROS PARA t1_mux2_1
  reg s2, s3, in2C;                                                             //CREAMOS LOS REGISTROS PARA t1_mux4_1
  reg s4, s5, s6;                                                               //CREAMOS LOS REGISTROS PARA t1_mux8_1
  reg s7, in4B, in4C;                                                           //CREAMOS LOS REGISTROS PARA t2_mux2_1
  reg s8, s9, in5C;                                                             //CREAMOS LOS REGISTROS PARA t2_mux4_1
  reg s10, s11, s12;                                                            //CREAMOS LOS REGISTROS PARA t2_mux8_1
  wire out1, out2, out3, out4, out5, out6;                                      //CREAMOS LAS SALIDAS PARA LOS MODULOS

  t1_mux2_1 U1(s1, in1B, in1C, out1);                                           //s1 ES NUESTRO SELECTOR (A), in1B, in1C son los valores de input de B y C
  t1_mux4_1 U2(s2, s3, in2C, out2);                                             //s2, s3 SON NUESTROS SELECTORES (A), (B). in2c el valor de input de C
  t1_mux8_1 U3(s4, s5, s6, GND, VCC, out3);                                     //s4, s5, s6 SON NUESTROS SELECTORES (A), (B), (C)
  t2_mux2_1 U4(s7, in4B, in4C, out4);                                           //s7 ES NUESTRO SELECTOR (A), in4B, in4C son los valores de input de B y C
  t2_mux4_1 U5(s8, s9, in5C, GND, out5);                                        //s8, s9 SON NUESTROS SELECTORES (A), (B). in5c el valor de input de C
  t2_mux8_1 U6(s10, s11, s12, GND, VCC, out6);                                  //s10, s11, s12 SON NUESTROS SELECTORES (A), (B), (C)


  initial begin                                                                 //INICIAMOS LA TABLA 1 CON EL MUX 2:1
  #1
  $display("\n");
  $display(" TABLA 1 MUX 2:1 ");
  $display("A FUNCIONA COMO SELECTOR");
  $display("A B C | Y1");
  $display("------|---");
  $monitor("%b %b %b | %b ", s1, in1B, in1C, out1);
     s1 = 0; in1B = 0; in1C = 0;
  #1 s1 = 0; in1B = 0; in1C = 1;
  #1 s1 = 0; in1B = 1; in1C = 0;
  #1 s1 = 0; in1B = 1; in1C = 1;
  #1 s1 = 1; in1B = 0; in1C = 0;
  #1 s1 = 1; in1B = 0; in1C = 1;
  #1 s1 = 1; in1B = 1; in1C = 0;
  #1 s1 = 1; in1B = 1; in1C = 1;
  end

  initial begin                                                                 //INICIAMOS LA TABLA 1 CON EL MUX 4:1
  #9
  $display("\n");
  $display(" TABLA 1 MUX 4:1 ");
  $display("A y B FUNCIONA COMO SELECTOR");
  $display("A B C | Y2");
  $display("------|---");
  $monitor("%b %b %b | %b ", s2, s3, in2C, out2); //selector s2 = A, s3 = B
     s2 = 0; s3 = 0; in2C = 0;
  #1 s2 = 0; s3 = 0; in2C = 1;
  #1 s2 = 0; s3 = 1; in2C = 0;
  #1 s2 = 0; s3 = 1; in2C = 1;
  #1 s2 = 1; s3 = 0; in2C = 0;
  #1 s2 = 1; s3 = 0; in2C = 1;
  #1 s2 = 1; s3 = 1; in2C = 0;
  #1 s2 = 1; s3 = 1; in2C = 1;
  end

  initial begin                                                                 //INICIAMOS LA TABLA 1 CON EL MUX 8:1
  #17
  $display("\n");
  $display(" TABLA 1 MUX 8:1 ");
  $display("A,B y C FUNCIONA COMO SELECTOR");
  $display("A B C | Y3");
  $display("------|---");
  $monitor("%b %b %b | %b ", s4, s5, s6, out3); //selector s4 = A, s5 = B, s6 = C
     s4 = 0; s5 = 0; s6 = 0;
  #1 s4 = 0; s5 = 0; s6 = 1;
  #1 s4 = 0; s5 = 1; s6 = 0;
  #1 s4 = 0; s5 = 1; s6 = 1;
  #1 s4 = 1; s5 = 0; s6 = 0;
  #1 s4 = 1; s5 = 0; s6 = 1;
  #1 s4 = 1; s5 = 1; s6 = 0;
  #1 s4 = 1; s5 = 1; s6 = 1;
  end

  initial begin                                                                 //INICIAMOS LA TABLA 2 CON EL MUX 2:1
  #25
  $display("\n");
  $display(" TABLA 2 MUX 2:1 ");
  $display("A FUNCIONA COMO SELECTOR");
  $display("A B C | Y4");
  $display("------|---");
  $monitor("%b %b %b | %b ", s7, in4B, in4C, out4);
     s7 = 0; in4B = 0; in4C = 0;
  #1 s7 = 0; in4B = 0; in4C = 1;
  #1 s7 = 0; in4B = 1; in4C = 0;
  #1 s7 = 0; in4B = 1; in4C = 1;
  #1 s7 = 1; in4B = 0; in4C = 0;
  #1 s7 = 1; in4B = 0; in4C = 1;
  #1 s7 = 1; in4B = 1; in4C = 0;
  #1 s7 = 1; in4B = 1; in4C = 1;
  end

  initial begin                                                                  //INICIAMOS LA TABLA 2 CON EL MUX 4:1
  #33
  $display("\n");
  $display(" TABLA 2 MUX 4:1 ");
  $display("A y B FUNCIONA COMO SELECTOR");
  $display("A B C | Y2");
  $display("------|---");
  $monitor("%b %b %b | %b ", s8, s9, in5C, out5); //selector s7 = A, s8 = B
     s8 = 0; s9 = 0; in5C = 0;
  #1 s8 = 0; s9 = 0; in5C = 1;
  #1 s8 = 0; s9 = 1; in5C = 0;
  #1 s8 = 0; s9 = 1; in5C = 1;
  #1 s8 = 1; s9 = 0; in5C = 0;
  #1 s8 = 1; s9 = 0; in5C = 1;
  #1 s8 = 1; s9 = 1; in5C = 0;
  #1 s8 = 1; s9 = 1; in5C = 1;
  end

  initial begin                                                                 //INICIAMOS LA TABLA 2 CON EL MUX 8:1
  #43
  $display("\n");
  $display(" TABLA 1 MUX 8:1 ");
  $display("A,B y C FUNCIONA COMO SELECTOR");
  $display("A B C | Y3");
  $display("------|---");
  $monitor("%b %b %b | %b ", s10, s11, s12, out6); //selector s4 = A, s5 = B, s6 = C
     s10 = 0; s11 = 0; s12 = 0;
  #1 s10 = 0; s11 = 0; s12 = 1;
  #1 s10 = 0; s11 = 1; s12 = 0;
  #1 s10 = 0; s11 = 1; s12 = 1;
  #1 s10 = 1; s11 = 0; s12 = 0;
  #1 s10 = 1; s11 = 0; s12 = 1;
  #1 s10 = 1; s11 = 1; s12 = 0;
  #1 s10 = 1; s11 = 1; s12 = 1;
  end

  initial begin                                                                 //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
        $dumpfile("MUX_tb.vcd");
        $dumpvars(0, testbench);
      end

endmodule
