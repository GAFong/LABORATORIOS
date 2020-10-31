//LABORATORIO 9
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 1
//TESTBENCH

module testbench ();
// variables del flipflopD
reg clk, reset1, enable1, D1;
wire Q1;

//variables del flipflopD de 2 BITS
reg reset2, enable2;
reg [1:0]D2;
wire [1:0]Q2;

//variables del flipflopD de 4 BITS
reg reset4, enable4;
reg [3:0]D4;
wire [3:0]Q4;

//Llamamos a nuestros modulos
flipflopD U1(clk, reset1,enable1,D1,Q1);
flipflop2D U2(clk, reset2, enable2,D2, Q2);
flipflop4D U3(clk, reset4, enable4,D4, Q4);

always begin //REALIZAMOS EL RELOJ Y QUE CAMBIE CADA UNIDAD DE TIEMPO
  clk <= 1; #1 clk <= ~clk; #1;
end

initial begin
reset1 = 1;enable1= 1; D1 = 0; //RESETEAMOS ENCENDEMOS EL ENABLE Y D = 0
#1
$display("\n");
$display(" FLIP FLOP TIPO D 1 BIT ");
$display("C \t R \t E  \t D\t | Q");
$monitor("%b \t %b\t %b \t %b \t | %b ", clk, reset1, enable1,D1, Q1 );
#2 D1 = 1; reset1 = 0; //
#2 D1 = 0;
#2 enable1 = 0; D1 = 1;
#4 D1 = 0;
#2 D1 = 1; enable1 = 1;
#2 reset1 = 1;
end
initial begin
reset2 = 1;enable2= 1; D2 = 2'B00; //RESETEAMOS ENCENDEMOS EL ENABLE Y D = 0
#18
$display("\n");
$display(" FLIP FLOP TIPO D 2 BITS ");
$display("C \t R \t E  \t D\t | Q");
$monitor("%b \t %b\t %b \t %b \t | %b ", clk, reset2, enable2,D2, Q2);
#2 D2 = 2'b01; reset2 = 0; //
#2 D2 = 2'b11;
#2 enable2 = 0; D2 = 2'b10;
#2 D2 = 2'b00;
#2 D2 = 2'b11;
#2 enable2 = 1; D2 = 2'b01;
#2 D2 = 2'b11;
#2 reset2 = 1;
end

initial begin
reset4 = 1;enable4= 1; D4 = 4'B0000; //RESETEAMOS ENCENDEMOS EL ENABLE Y D = 0
#34
$display("\n");
$display(" FLIP FLOP TIPO D 4 BITS ");
$display("C \t R \t E  \t   D\t |   Q");
$monitor("%b \t %b\t %b \t %b \t | %b ", clk, reset4, enable4,D4, Q4);
#2 D4 = 4'b0101; reset4 = 0; //
#2 D4 = 4'b1100;
#2 enable4 = 0; D4 = 4'b1000;
#2 D4 = 4'b1000;
#2 D4 = 4'b0000;
#2 enable4 = 1; D4 = 4'b1001;
#2 D4 = 4'b1111;
#2 $finish;
end

initial begin                                                                 //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
      $dumpfile("LAB9_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule // testbench
