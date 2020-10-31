//LABORATORIO 9
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 5
//TESTBENCH
module testbench ();
reg [6:0]ADDRESS;
wire [12:0]Y;

ROM U1(ADDRESS,Y);

initial begin
#1
$display("\n");
$display(" MEMORIA ROM ");
$display("ADDRESS \t |  Y");
$monitor("%b \t | %b ", ADDRESS, Y );
#1 ADDRESS = 7'b0000000;//caso1
#1 ADDRESS = 7'b0100000;
#1 ADDRESS = 7'b1000000;
#1 ADDRESS = 7'b0000010;
#1 ADDRESS = 7'b1111110;
#1 ADDRESS = 7'b0000101;//caso 2
#1 ADDRESS = 7'b0000011;//caso 3
#1 ADDRESS = 7'b0001101;//caso 4
#1 ADDRESS = 7'b0010011;//caso 6
#1 ADDRESS = 7'b0011001;//caso 7
#1 ADDRESS = 7'b0101101;//caso 9
#1 ADDRESS = 7'b0100101;//caso 8
#1 ADDRESS = 7'b0110011;//caso 10
#1 ADDRESS = 7'b0111001;//caso 11
#1 ADDRESS = 7'b1000111;//caso 12
#1 ADDRESS = 7'b1001111;//caso 14
#1 ADDRESS = 7'b0000001;//caso 13
#1 ADDRESS = 7'b1001001;//caso 15
#1 ADDRESS = 7'b1010001;//caso 16
#1 ADDRESS = 7'b1011011;//caso 17
#1 ADDRESS = 7'b1111111;//caso 21
#1 ADDRESS = 7'b1110111;//caso 20
#1 ADDRESS = 7'b1101001;//caso 19
#1 ADDRESS = 7'b1100001;//caso 18
#1 ADDRESS = 7'b0011111;//caso 7
#1 ADDRESS = 7'b0110111;//caso 10
#1 ADDRESS = 7'b0001111;//caso 4
#1 ADDRESS = 7'b1001101;//caso 15
#1 ADDRESS = 7'b1110011;//caso 20
#1 ADDRESS = 7'b1111101;//caso 21
#1 ADDRESS = 7'b1111100;//caso 1

#1 $finish;
end

initial begin                                                                 //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
      $dumpfile("LAB9_5_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule // testbench
