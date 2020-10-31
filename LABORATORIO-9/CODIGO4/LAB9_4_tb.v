//LABORATORIO 9
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 4
//TESTBENCH

//Variables del buffer
module testbench ();
reg enable;
reg [3:0]D;
wire [3:0]Y;

buffer4 U1(D, enable,Y);

initial begin
enable= 1; D = 4'b0000; //RESETEAMOS ENCENDEMOS EL ENABLE Y D = 0
#1
$display("\n");
$display(" BUFFER TRIESTADO 4 BITS ");
$display("E \t  D \t |  Y");
$monitor("%b \t %b\t | %b ", enable, D, Y );
#1  D = 4'b0001;
#1  D = 4'b1001;
#1  D = 4'b1101;
#1 enable = 0;//dejamos de pasar valores en el buffer
#1  D = 4'b1100;
#1 enable = 1;//volvemos a dejar pasar los valores en el buffer
#1  D = 4'b1111;
#1 $finish;
end

initial begin                                                                 //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
      $dumpfile("LAB9_4_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule // testbench
