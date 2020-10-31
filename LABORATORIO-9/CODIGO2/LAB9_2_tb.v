//LABORATORIO 9
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 2
//TESTBENCH

module testbench ();

//variables del modulos
reg clk, reset, enable;
wire Q;

flipflopT U1(clk, reset,enable,Q);

always begin //REALIZAMOS EL RELOJ Y QUE CAMBIE CADA UNIDAD DE TIEMPO
  clk <= 1; #1 clk <= ~clk; #1;
end

initial begin
reset = 1;enable= 1;  //RESETEAMOS ENCENDEMOS EL ENABLE Y D = 0
#1
$display("\n");
$display(" FLIP FLOP TOGGLE ");
$display("C \t R \t E  \t | Q");
$monitor("%b \t %b\t %b \t | %b ", clk, reset, enable, Q );
#2 reset = 0; //
#10 enable = 0;
#4 reset = 1;
#2 $finish;
end

initial begin                                                                 //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
      $dumpfile("LAB9_2_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule // testbench
