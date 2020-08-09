//---------------------------
//GABRIEL ALEXANDER FONG PENAGOS
//CARNET 19722
//ELECTRONICA DIGITAL
//LABORATORIO 03
//EJERCICIO TABLA 04 VERSION SOP

module tabla_04s();                                         //GENERAMOS EL MODULO

  wire w1,w2,w3,w4,w5,w6,w7,nA,nB,nC,nD,sal;                //NOMBRAMOS NUESTROS CABLES QUE SALDRAN DE LAS AND, LAS NEGACIONES DE NUESTRA VARIABLES BINARIAS Y LA SALIDA
  reg A, B, C, D;                                          //NOMBRAMOS NUESTRAS ENTRADAS COMO REGISTROS

//COMPUERTAS

//COMPUERTAS NOT
  not U1(nA,A);
  not U2(nB,B);
  not U3(nC,C);
  not U4(nD,D);

//COMPUERTAS AND
  and U5(w1,nA,nB,nC,nD);
  and U6(w2,nA,nB,C,nD);
  and U7(w3,nA,nB,C,D);
  and U8(w4,nA,B,C,nD);
  and U9(w5,nA,B,C,D);
  and U10(w6,A,nB,nC,nD);
  and U11(w7,A,nB,C,nD);

//COMPUERTA OR
  or  U12(sal,w1,w2,w3,w4,w5,w6,w7);

  initial begin                                               //INICIAMOS LA SIMULACION
    $display("SOP A B C D|Y");                                //IMPRIMIMOS EN LA TERMINAL
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
      $dumpfile("tabla_04s_tb.vcd");                           //COLOCAMOS LA EXTENSION DEL ARCHIVO _tb Y COLOCAMOS .vcd PARA MOSTRAR EN GTK WAVE
      $dumpvars(0,tabla_04s);                                  //TOMAMOS LOS VALORES DEL ARCHIVO
    end

  endmodule                                       //TERMINAMOS EL MODULO
