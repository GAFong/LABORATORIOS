//GABRIEL ALEXANDER FONG PENAGOS
//CARNE 19722
//LABORATORIO 04
//LABORATORIO 04
//EJERCICIO 04 testbench

module testbench();

  reg in1A, in1B, in1C;                                                         //REGISTROS DEL MODULO gl1_1
  reg in2A, in2B, in2C;                                                         //REGISTROS DEL MODULO gl1_2
  reg in3A, in3B, in3C, in3D;                                                   //REGISTROS DEL MODULO op1_3
  reg in4A, in4B, in4C, in4D;                                                   //REGISTROS DEL MODULO op1_4
  reg in5A, in5B, in5C, in5D;                                                   //REGISTROS DEL MODULO op2_1
  reg in6A, in6B, in6C;                                                         //REGISTROS DEL MODULO gl2_2
  reg in7A, in7B, in7C, in7D;                                                   //REGISTROS DEL MODULO op2_3
  reg in8A, in8B, in8C;                                                         //REGISTROS DEL MODULO gl2_4

  wire out1, out2, out3, out4, out5, out6, out7, out8;

  gl1_1 G1(in1A, in1B, in1C, out1);                                             //NOMBRAMOS EL MODULO Y ADENTRO COLOCAMOS LAS ENTRADSDAS Y SALIDAS A UTILIZAR, TIENEN QUE COINCIDR CON LAS CREADAS EN EL MODULO
  gl1_2 G2(in2A, in2B, in2C, out2);
  op1_3 OP3(in3A, in3B, in3C, in3D, out3);
  op1_4 OP4(in4A, in4B, in4C, in4D, out4);
  op2_1 OP5(in5A, in5B, in5C, in5D, out5);
  gl2_2 G6(in6A, in6B, in6C, out6);
  op2_3 OP7(in7A, in7B, in7C, in7D, out7);
  gl2_4 G8(in8A, in8B, in8C, out8);

  initial begin                                                                 //INICIAMOS EL MODULO gl1_1
    $display("");
    $display(" EJERCICIO 1 TABLA 1");
    $display(" A B C | Y1");
    $display("-------|----");
    $monitor("%b %b %b | %b", in1A, in1B, in1C, out1);
       in1A = 0; in1B = 0; in1C = 0;
    #1 in1A = 0; in1B = 0; in1C = 1;
    #1 in1A = 0; in1B = 1; in1C = 0;
    #1 in1A = 0; in1B = 1; in1C = 1;
    #1 in1A = 1; in1B = 0; in1C = 0;
    #1 in1A = 1; in1B = 0; in1C = 1;
    #1 in1A = 1; in1B = 1; in1C = 0;
    #1 in1A = 1; in1B = 1; in1C = 1;

    end

    initial begin                                                               //INICIAMOS EL MODULO gl1_2
    #9
    $display("");
    $display(" EJERCICIO 1 TABLA 2");
    $display(" A B C | Y2");
    $display("-------|----");
    $monitor("%b %b %b | %b", in2A, in2B, in2C, out2);
       in2A = 0; in2B = 0; in2C = 0;
    #1 in2A = 0; in2B = 0; in2C = 1;
    #1 in2A = 0; in2B = 1; in2C = 0;
    #1 in2A = 0; in2B = 1; in2C = 1;
    #1 in2A = 1; in2B = 0; in2C = 0;
    #1 in2A = 1; in2B = 0; in2C = 1;
    #1 in2A = 1; in2B = 1; in2C = 0;
    #1 in2A = 1; in2B = 1; in2C = 1;

    end

    initial begin                                                               // INICIAMOS EL MODULO op1_3
    #17
    $display("");
    $display(" EJERCICIO 1 TABLA 3");
    $display(" A B C D | Y3");
    $display("---------|----");
    $monitor("%b %b %b %b | %b", in3A, in3B, in3C, in3D, out3);
       in3A = 0; in3B = 0; in3C = 0; in3D = 0;
    #1 in3A = 0; in3B = 0; in3C = 0; in3D = 1;
    #1 in3A = 0; in3B = 0; in3C = 1; in3D = 0;
    #1 in3A = 0; in3B = 0; in3C = 1; in3D = 1;
    #1 in3A = 0; in3B = 1; in3C = 0; in3D = 0;
    #1 in3A = 0; in3B = 1; in3C = 0; in3D = 1;
    #1 in3A = 0; in3B = 1; in3C = 1; in3D = 0;
    #1 in3A = 0; in3B = 1; in3C = 1; in3D = 1;
    #1 in3A = 1; in3B = 0; in3C = 0; in3D = 0;
    #1 in3A = 1; in3B = 0; in3C = 0; in3D = 1;
    #1 in3A = 1; in3B = 0; in3C = 1; in3D = 0;
    #1 in3A = 1; in3B = 0; in3C = 1; in3D = 1;
    #1 in3A = 1; in3B = 1; in3C = 0; in3D = 0;
    #1 in3A = 1; in3B = 1; in3C = 0; in3D = 1;
    #1 in3A = 1; in3B = 1; in3C = 1; in3D = 0;
    #1 in3A = 1; in3B = 1; in3C = 1; in3D = 1;

    end

    initial begin                                                               //INICIAMOS EL MODULO op1_4
    #33
    $display("");
    $display(" EJERCICIO 1 TABLA 4");
    $display(" A B C D | Y4");
    $display("---------|----");
    $monitor("%b %b %b %b | %b", in4A, in4B, in4C, in4D, out4);
       in4A = 0; in4B = 0; in4C = 0; in4D = 0;
    #1 in4A = 0; in4B = 0; in4C = 0; in4D = 1;
    #1 in4A = 0; in4B = 0; in4C = 1; in4D = 0;
    #1 in4A = 0; in4B = 0; in4C = 1; in4D = 1;
    #1 in4A = 0; in4B = 1; in4C = 0; in4D = 0;
    #1 in4A = 0; in4B = 1; in4C = 0; in4D = 1;
    #1 in4A = 0; in4B = 1; in4C = 1; in4D = 0;
    #1 in4A = 0; in4B = 1; in4C = 1; in4D = 1;
    #1 in4A = 1; in4B = 0; in4C = 0; in4D = 0;
    #1 in4A = 1; in4B = 0; in4C = 0; in4D = 1;
    #1 in4A = 1; in4B = 0; in4C = 1; in4D = 0;
    #1 in4A = 1; in4B = 0; in4C = 1; in4D = 1;
    #1 in4A = 1; in4B = 1; in4C = 0; in4D = 0;
    #1 in4A = 1; in4B = 1; in4C = 0; in4D = 1;
    #1 in4A = 1; in4B = 1; in4C = 1; in4D = 0;
    #1 in4A = 1; in4B = 1; in4C = 1; in4D = 1;

    end
    initial begin                                                               //INICIAMOS EL MODULO op2_1
    #49
    $display("");
    $display(" EJERCICIO 2 TABLA 1");
    $display(" A B C D | Y5");
    $display("---------|----");
    $monitor("%b %b %b %b | %b", in5A, in5B, in5C, in5D, out5);
       in5A = 0; in5B = 0; in5C = 0; in5D = 0;
    #1 in5A = 0; in5B = 0; in5C = 0; in5D = 1;
    #1 in5A = 0; in5B = 0; in5C = 1; in5D = 0;
    #1 in5A = 0; in5B = 0; in5C = 1; in5D = 1;
    #1 in5A = 0; in5B = 1; in5C = 0; in5D = 0;
    #1 in5A = 0; in5B = 1; in5C = 0; in5D = 1;
    #1 in5A = 0; in5B = 1; in5C = 1; in5D = 0;
    #1 in5A = 0; in5B = 1; in5C = 1; in5D = 1;
    #1 in5A = 1; in5B = 0; in5C = 0; in5D = 0;
    #1 in5A = 1; in5B = 0; in5C = 0; in5D = 1;
    #1 in5A = 1; in5B = 0; in5C = 1; in5D = 0;
    #1 in5A = 1; in5B = 0; in5C = 1; in5D = 1;
    #1 in5A = 1; in5B = 1; in5C = 0; in5D = 0;
    #1 in5A = 1; in5B = 1; in5C = 0; in5D = 1;
    #1 in5A = 1; in5B = 1; in5C = 1; in5D = 0;
    #1 in5A = 1; in5B = 1; in5C = 1; in5D = 1;

    end

    initial begin                                                               //INICIAMOSEL MODULO gl2_2
    #65
    $display("");
    $display(" EJERCICIO 2 TABLA 2");
    $display(" A B C | Y6");
    $display("-------|----");
    $monitor("%b %b %b | %b", in6A, in6B, in6C, out6);
       in6A = 0; in6B = 0; in6C = 0;
    #1 in6A = 0; in6B = 0; in6C = 1;
    #1 in6A = 0; in6B = 1; in6C = 0;
    #1 in6A = 0; in6B = 1; in6C = 1;
    #1 in6A = 1; in6B = 0; in6C = 0;
    #1 in6A = 1; in6B = 0; in6C = 1;
    #1 in6A = 1; in6B = 1; in6C = 0;
    #1 in6A = 1; in6B = 1; in6C = 1;

    end

    initial begin                                                               //INICIAMOS EL MODULO op2_3
    #73
    $display("");
    $display(" EJERCICIO 2 TABLA 3");
    $display(" A B C D | Y7");
    $display("---------|----");
    $monitor("%b %b %b %b | %b", in7A, in7B, in7C, in7D, out7);
       in7A = 0; in7B = 0; in7C = 0; in7D = 0;
    #1 in7A = 0; in7B = 0; in7C = 0; in7D = 1;
    #1 in7A = 0; in7B = 0; in7C = 1; in7D = 0;
    #1 in7A = 0; in7B = 0; in7C = 1; in7D = 1;
    #1 in7A = 0; in7B = 1; in7C = 0; in7D = 0;
    #1 in7A = 0; in7B = 1; in7C = 0; in7D = 1;
    #1 in7A = 0; in7B = 1; in7C = 1; in7D = 0;
    #1 in7A = 0; in7B = 1; in7C = 1; in7D = 1;
    #1 in7A = 1; in7B = 0; in7C = 0; in7D = 0;
    #1 in7A = 1; in7B = 0; in7C = 0; in7D = 1;
    #1 in7A = 1; in7B = 0; in7C = 1; in7D = 0;
    #1 in7A = 1; in7B = 0; in7C = 1; in7D = 1;
    #1 in7A = 1; in7B = 1; in7C = 0; in7D = 0;
    #1 in7A = 1; in7B = 1; in7C = 0; in7D = 1;
    #1 in7A = 1; in7B = 1; in7C = 1; in7D = 0;
    #1 in7A = 1; in7B = 1; in7C = 1; in7D = 1;

    end

    initial begin
    #89                                                                         //INICIAMOS EL MODULO gl2_4
    $display("");
    $display(" EJERCICIO 2 TABLA 4");
    $display(" A B C | Y8");
    $display("-------|----");
    $monitor("%b %b %b | %b", in8A, in8B, in8C, out8);
       in8A = 0; in8B = 0; in8C = 0;
    #1 in8A = 0; in8B = 0; in8C = 1;
    #1 in8A = 0; in8B = 1; in8C = 0;
    #1 in8A = 0; in8B = 1; in8C = 1;
    #1 in8A = 1; in8B = 0; in8C = 0;
    #1 in8A = 1; in8B = 0; in8C = 1;
    #1 in8A = 1; in8B = 1; in8C = 0;
    #1 in8A = 1; in8B = 1; in8C = 1;

      end

    initial begin                                                               //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE

      $dumpfile("LAB4_tb.vcd");
      $dumpvars(0, testbench);

    end

  endmodule
