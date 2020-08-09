//---------------------------
//GABRIEL ALEXANDER FONG PENAGOS
//CARNET 19722
//ELECTRONICA DIGITAL
//LABORATORIO 03
//EJERCICIO TABLA 04 VERSION POS

module tabla_04p();                                         //GENERAMOS EL MODULO

  wire w1,w2,w3,w4,w5,w6,w7,w8,w9,nA,nB,nC,nD,sal;         //NOMBRAMOS NUESTROS CABLES QUE SALDRAN DE LAS AND, LAS NEGACIONES DE NUESTRA VARIABLES BINARIAS Y LA SALIDA
  reg A, B, C, D;                                          //NOMBRAMOS NUESTRAS ENTRADAS COMO REGISTROS

//COMPUERTAS

//COMPUERTAS NOT
  not U1(nA,A);
  not U2(nB,B);
  not U3(nC,C);
  not U4(nD,D);

//COMPUERTAS OR
  or  U5(w1,A,B,C,nD);
  or  U6(w2,A,nB,C,D);
  or  U7(w3,A,nB,C,nD);
  or  U8(w4,nA,B,C,nD);
  or  U9(w5,nA,B,nC,nD);
  or  U10(w6,nA,nB,C,D);
  or  U11(w7,nA,nB,C,nD);
  or  U12(w8,nA,nB,nC,D);
  or  U13(w9,nA,nB,nC,nD);

//COMPUERTAS AND
  and U14(sal,w1,w2,w3,w4,w5,w6,w7,w8,w9);

  initial begin                                               //INICIAMOS LA SIMULACION
    $display("POS A B C D|Y");                                //IMPRIMIMOS EN LA TERMINAL
    $display("---------|-");
    $monitor("%b %b %b %B| %b", A, B, C, D, sal);             //MUESTRA LOS VALORES DE A B C D y LA SALIDA
    A = 0; B = 0; C = 0; D = 0;                               //CAMBIAMOS LOS VALORES
    #1 A = 0; B = 0; C = 0; D = 1;                            //COLOCAMOS UN INTERVALO DE TIEMPO PARA CAMBIAR LOS VALORES DE LAS ENTRADAS
    #1 A = 0; B = 0; C = 1; D = 0;
    #1 A = 0; B = 0; C = 1; D = 1;
    #1 A = 0; B = 1; C = 0; D = 0;
    #1 A = 0; B = 1; C = 0; D = 1;
    #1 A = 0; B = 1; C = 1; D = 0;
    #1 A = 0; B = 1; C = 1; D = 1;
    #1 A = 1; B = 0; C = 0; D = 0;
    #1 A = 1; B = 0; C = 0; D = 1;
    #1 A = 1; B = 0; C = 1; D = 0;
    #1 A = 1; B = 0; C = 1; D = 1;
    #1 A = 1; B = 1; C = 0; D = 0;
    #1 A = 1; B = 1; C = 0; D = 1;
    #1 A = 1; B = 1; C = 1; D = 0;
    #1 A = 1; B = 1; C = 1; D = 1;
    #1 $finish;                                                 //FINALIZAMOS LA SIMULACION
  end

  initial                                                      //INICIAMOS PARA MOSTRAR LA SIMULACION EN GTK WAVE
    begin
      $dumpfile("tabla_04p_tb.vcd");                           //COLOCAMOS LA EXTENSION DEL ARCHIVO _tb Y COLOCAMOS .vcd PARA MOSTRAR EN GTK WAVE
      $dumpvars(0,tabla_04p);                                  //TOMAMOS LOS VALORES DEL ARCHIVO
    end

  endmodule                                       //TERMINAMOS EL MODULO
