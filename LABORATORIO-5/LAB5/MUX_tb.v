

module testbench ();

  wire GND;
  wire VCC;
  assign GND = 0;
  assign VCC = 1;
  reg s1, in1B, in1C;
  reg s2, s3, in2C;
  reg s4, s5, s6;
  reg s7, in4B, in4C;
  reg s8, s9, in5C;
  reg s10, s11, s12;
  wire out1, out2, out3, out4, out5, out6;

  t1_mux2_1 U1(s1, in1B, in1C, out1);
  t1_mux4_1 U2(s2, s3, in2C, out2);
  t1_mux8_1 U3(s4, s5, s6, GND, VCC, out3);
  t2_mux2_1 U4(s7, in4B, in4C, out4);
  t2_mux4_1 U5(s8, s9, in5C, GND, out5);
  t2_mux8_1 U6(s10, s11, s12, GND, VCC, out6);


  initial begin
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

  initial begin
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

  initial begin
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

  initial begin
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

  initial begin
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

  initial begin
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

  initial begin                                                               //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
        $dumpfile("MUX_tb.vcd");
        $dumpvars(0, testbench);
      end

endmodule
