//LABORATORIO 9
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 3
//TESTBENCH
module testbench ();
//Variables para el flipflopJK
reg clk, reset, enable, J, K;
wire Q;

flipflopJK U1(clk, reset, enable, J, K, Q);
always begin //REALIZAMOS EL RELOJ Y QUE CAMBIE CADA UNIDAD DE TIEMPO
  clk <= 1; #1 clk <= ~clk; #1;
end

initial begin
reset = 1;enable= 1;  //RESETEAMOS ENCENDEMOS EL ENABLE Y D = 0
#1
$display("\n");
$display(" FLIP FLOP JK ");
$display("C \t R \t E \t J \t K \t | Q");
$monitor("%b \t %b\t %b \t %b \t %b \t | %b ", clk, reset, enable,J,K, Q );
#2 reset = 0;J = 0; K = 0; //
#2 J = 0; K = 1;
#2 J = 1; K = 0;
#2 J = 1; K = 1;
#4 reset = 1;
#2 reset = 0; J = 1; K = 0;
#2 enable = 0;
#4 $finish;
end

initial begin                                                                 //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
      $dumpfile("LAB_3_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule // testbench
