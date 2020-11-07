//LABORATORIO 10
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 1
//TESTBENCH

module testbench ();

reg clk, reset, enableP,enableF, loads; //variables de todo el programa
reg [11:0]LOAD;
wire [7:0]PROGRAM_BYTE;
wire [3:0]INSTR;
wire [3:0]OPRND;

always begin //REALIZAMOS EL RELOJ Y QUE CAMBIE CADA UNIDAD DE TIEMPO
  clk <= 1; #1 clk <= ~clk; #1;
end

//PROGRAMCOUNTER U1(clk,reset,enable,loads,LOAD,PC);
//PROGRAMROM U2(PC,PROGRAM_BYTE);
//FETCH U3(clk,reset,enable,PROGRAM_BYTE,INSTR,OPRND);
Parte1 U1(clk, reset, enableP,loads, enableF,LOAD, PROGRAM_BYTE,INSTR,OPRND);

initial begin
reset = 1;enableP= 1;enableF = 1; loads =0; //RESETEAMOS ENCENDEMOS EL ENABLE, la bandera del load la apagamos
#1
$display("\n");
$display(" EJERCICIO 1");
$display("CLK \t RESET \t ENABLEP \t ENABLEF \t LOADS   |\t   LOAD \t PROGRAM_BYTE \t INSTR \t OPRND");
$display("--------------------------------------------------------------------------------------------------------------");
$monitor("  %b \t %b\t   %b \t\t %b \t\t   %b \t |  \t %b \t %b \t %b \t %b", clk, reset, enableP,enableF,loads,LOAD, PROGRAM_BYTE, INSTR, OPRND );
#1 reset = 0;
#10 LOAD = 12'b000000001111;
#2 loads = 1;
#4 loads = 0;
#2 enableP = 0; LOAD = 12'b000000001100;
#6 enableP = 1;
#2 loads = 1;
#2 loads = 0; enableF = 0;
#4 enableF = 1;
#4 $finish;
end
initial begin                                                                 //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
      $dumpfile("LAB10_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule // testbench
