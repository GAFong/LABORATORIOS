//LABORATORIO 10
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICO 2
//TESTBENCH

module testbench ();
reg clk, resetA, enableB1, enableB2, enableA;
reg [3:0]OPRND;
reg [2:0]F;
wire [3:0] OUT, DATA, ALUY, ACU;
wire CARRY, ZERO;


always begin //REALIZAMOS EL RELOJ Y QUE CAMBIE CADA UNIDAD DE TIEMPO
  clk <= 1; #1 clk <= ~clk; #1;
end

PARTE2 U1(clk, resetA,enableA, enableB1, enableB2,F, OPRND,OUT, DATA, ALUY, ACU, CARRY, ZERO);

initial begin
resetA = 1;enableB1= 1;enableB2 = 1; F = 3'b000; enableA = 1; //RESETEAMOS ENCENDEMOS EL ENABLE, la bandera del load la apagamos
#1
$display("\n");
$display(" EJERCICIO 2");
$display("CLK   RESETA \t ENABLEB1   ENABLEB2 \t F  \t OPRND \t OUT \t DATA \t SALIDA  ACCU \t CARRY \t ZERO ");
$display("--------------------------------------------------------------------------------------------------------------");
$monitor("  %b \t %b\t   %b \t\t %b \t %b \t  %b \t %b \t %b \t %b \t %b \t %b \t %b  ", clk, resetA, enableB1,enableB2,F,OPRND,OUT,DATA, ALUY, ACU, CARRY, ZERO);
#1 resetA = 0;
#2 OPRND = 4'b1010;
#2 F = 3'b010;
#2 F = 3'b001;
#2 F = 3'b011;
#2 F = 3'b100; enableB2 = 0; OPRND = 4'b1111;
#2 F = 3'b010;
#2 enableB2 = 1;
#2 F = 3'b000;
#2 enableB1 = 0;OPRND = 4'b0001;
#2 F = 3'b010;
#2 enableB1 = 1;
#2 $finish;
end

initial begin                                                                 //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
      $dumpfile("LAB10D_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule // testbench
