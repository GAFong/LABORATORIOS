//GABRIEL ALEXANDER FONG PENAGOS
//CARNE 19722
//ELECTRONICA DIGITAL
//LABORATORIO 06

module testbench();
  reg clk, clk2,reset, reset2, set;
  reg [3:0]D;
  reg A, B, A1;
  wire S0, S1, SF0, SF1;
  wire [3:0]Q;
  wire Y1;
  wire O1, O2, O3;


  always //REALIZAMOS LA SECUENCIA DEL CLK cambio de flanco de 1 unidad de tiempo
    begin
      clk <= 1; #1 clk <= ~clk; #1;
  end
  always //REALIZAMOS LA SECUENCIA DEL CLK cambio de flanco de 1 unidad de tiempo
    begin
      clk2 <= 1; #1 clk2 <= ~clk2; #1;
  end
  always //REALIZAMOS LA SECUENCIA DEL reset que resetee cada 5 unidades de tiempo
    begin
      reset <= 0; #5 reset <= ~reset; #1;
  end
  flipflopD U1(clk,reset,set,D,Q);
  FSM1 U2(A, B,clk,reset,S0,S1, SF0, SF1, Y1);
  FSM2 U3(A1, clk2, reset2, O1, O2, O3);

  initial begin //PRUEBA DEL FLIP FLOP D
  #1
  $display("\n");
  $display(" FLIP FLOP D ");
  $display("C R S   D     Q");
  $monitor("%b %b %b %b | %b ", clk, reset, set, D[3:0], Q[3:0] );
     set = 1;
  #1 D[0] = 0; D[1] = 0; D[2] = 0; D[3] = 0; set = 0;
  #1 D[0] = 1; D[1] = 0; D[2] = 1; D[3] = 0;
  #1 D[0] = 1; D[1] = 0; D[2] = 0; D[3] = 1;
  #1 D[0] = 0; D[1] = 0; D[2] = 1; D[3] = 1;
  #1 D[0] = 0; D[1] = 0; D[2] = 0; D[3] = 0;
  #1 D[0] = 1; D[1] = 0; D[2] = 0; D[3] = 0;
  #1 D[0] = 1; D[1] = 0; D[2] = 0; D[3] = 1;
  #1 set = 1;
  #1 D[0] = 1; D[1] = 1; D[2] = 0; D[3] = 0;  set = 0;
  #1 D[0] = 1; D[1] = 1; D[2] = 0; D[3] = 0;
  #1 D[0] = 0; D[1] = 0; D[2] = 1; D[3] = 0;
  #1 D[0] = 0; D[1] = 0; D[2] = 1; D[3] = 0;
  #1 D[0] = 1; D[1] = 1; D[2] = 0; D[3] = 1;
  #1 D[0] = 1; D[1] = 0; D[2] = 0; D[3] = 1;
  end
  initial begin //PRUEBA DEL FLIP FLOP D
  #20
  $display("\n");
  $display(" FSM 1 ");
  $display("MOSTRAREMOS CLK, A, B, S0, S1, S'0, S'1 Y");
  $display(" A B 0 1 F0 F1 Y");
  $monitor(" %b %b %b %b %b %b %b ", A, B, S0, S1, SF0, SF1, Y1 );
     A = 0; B = 0;
  #2 A = 1; B = 0;
  #2 A = 1; B = 1;
  #2 A = 1; B = 1;
  #2 A = 1; B = 1;
  #2 A = 0; B = 0;
  #2 A = 1; B = 0;
  #2 A = 0; B = 0;

  end

  initial begin //PRUEBA DEL FLIP FLOP D
  #40
     reset2 = 1;
  #1 reset2 = 0;
  $display("\n");
  $display(" FSM 2 ");
  $display("A | GRAY");
  $monitor("%b | %b %b %b  ", A1, O3, O2, O1);
     A1 = 1;
  #2 A1 = 1;
  #2 A1 = 1;
  #2 A1 = 1;
  #2 A1 = 0;
  #2 A1 = 1;
  #2 A1 = 1;
  #2 A1 = 1;
  #2 A1 = 1;
  #2 A1 = 1;
  #2 A1 = 1;
  #2 A1 = 0;
  #2 A1 = 0;
  #2 A1 = 0;
  #2 A1 = 0;

  #1 $finish;
  end

  initial begin                                                                 //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
        $dumpfile("LAB6_tb.vcd");
        $dumpvars(0, testbench);
      end

endmodule
