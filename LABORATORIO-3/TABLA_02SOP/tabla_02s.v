//---------------------------
//GABRIEL ALEXANDER FONG PENAGOS
//CARNET 19722
//ELECTRONICA DIGITAL
//LABORATORIO 03
//EJERCICIO TABLA 02 VERSION SOP

module tabla_02s();                           //GENERAMOS EL MODULO

  wire w1,w2,w3,nA,nB,nC,sal;                 //NOMBRAMOS NUESTROS CABLES QUE SALDRAN DE LAS AND, LAS NEGACIONES DE NUESTRA VARIABLES BINARIAS Y LA SALIDA
  reg A, B, C;                                //NOMBRAMOS NUESTRAS ENTRADAS COMO REGISTROS

//COMPUERTAS

//COMPUERTAS NOT
  not U1(nA,A);
  not U2(nB,B);
  not U3(nC,C);

//COMPUERTAS AND
  and U4(w1,nA,nB,C);
  and U5(w2,A,B,nC);
  and U6(w3,A,B,C);

//COMPUERTA OR
  or  U9(sal,w1,w2,w3);

  initial begin                                 //INICIAMOS LA SIMULACION
    $display("SOP A B C|Y");                   //IMPRIMIMOS EN LA TERMINAL
    $display("----------|");
    $monitor("%b %b %b | %b", A, B, C, sal);      //MUESTRA LOS VALORES DE A B C y LA SALIDA
    A = 0; B = 0; C = 0;                          //CAMBIAMOS LOS VALORES
    #1 A = 0; B = 0; C = 1;                       //COLOCAMOS UN INTERVALO DE TIEMPO PARA CAMBIAR LOS VALORES DE LAS ENTRADAS
    #1 A = 0; B = 1; C = 0;
    #1 A = 0; B = 1; C = 1;
    #1 A = 1; B = 0; C = 0;
    #1 A = 1; B = 0; C = 1;
    #1 A = 1; B = 1; C = 0;
    #1 A = 1; B = 1; C = 1;
    #1 $finish;                                    //FINALIZAMOS LA SIMULACION
  end

  initial                                          //INICIAMOS PARA MOSTRAR LA SIMULACION EN GTK WAVE
    begin
      $dumpfile("tabla_02s_tb.vcd");               //COLOCAMOS LA EXTENSION DEL ARCHIVO _tb Y COLOCAMOS .vcd PARA MOSTRAR EN GTK WAVE
      $dumpvars(0,tabla_02s);                      //TOMAMOS LOS VALORES DEL ARCHIVO
    end

  endmodule                                       //TERMINAMOS EL MODULO
