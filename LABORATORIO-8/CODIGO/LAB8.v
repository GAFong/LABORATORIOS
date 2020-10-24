//LABORATORIO 8
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722

//MODULO CONTADOR
module contador(input wire clk, reset,enable,loads,
                input wire [11:0]LOAD,
                output reg[11:0]CB);

  always @ (posedge clk, posedge reset ) begin //REALIZAMOS UN ALWAYS PARA QUE SE EJECUTE EN TODOO MOMENTO Y CAMBIE EN EL FLANCO DE RELOJ
  if (reset) begin //RESETEA EL VALOR EN 0 LOS 12 BITS
    CB <= 12'b0;
  end
  else if (loads)begin //SI EL LOAD ES 1 COLOCAR EN LA SALIDA EL VALOR PRE-COLOCADO
  CB <= LOAD;
end
else //SI ENABLE ES 1 SUMA 1 EN CADA FLANCO DE RELOJ, SI NO NO SUMA
  if (enable) begin
  CB <= CB + 1;
  end
end
endmodule

//Modulo de lectura de datos de la ROM de 4k X 8
module ROM (input wire [11:0]Addres, // DIRECCION DE 12 BITS
  output wire [7:0]DATO); //TAMAÑO DEL DATO DE 8 BITS

  reg [7:0] MEM[0:4095]; //MEM ES DE TAMAÑO DE 2^12 = 4096 Y CREA EL ARREGLO PARA NUESTROS DATOS
  initial begin         //INICIAMOS LA LECTURA DE NUESTRA LISTA
    $readmemb("Lista.list", MEM);//LEEMOS LOS VALORES DE LA LISTA EN BINARIO
  end
  assign DATO = MEM[Addres]; //LE ASIGANMOS EL VALOR DE MEM EN LA DIRECCION INGRESADA
endmodule // ROM

//MODULO DE ALU DE SALIDA DE 4 BITS
module ALUU(input wire [3:0]A,B,
            input wire [2:0]SEL,
            output reg [3:0]Sal);



  always @ (A,B,SEL) begin //SIEMPRE QUE OCURRA UN CAMBIO EN A B O SEL REALIZARLO EN EL MOMENTO
    case (SEL)            //EL SEL SELECCIONA EL CASE QUE TIENE 8 POSIBLES CASOS DIFERENTES
        3'b000: Sal <= A & B ; //FUNCION  A AND B
        3'b001: Sal <= A | B ; //FUNCION A OR B
        3'b010: Sal <= A + B ; //FUNCION A ADD B
        3'b011: Sal <= Sal ; //,COLOCAMOS TODOO el MISMO VALOR DE ANTES
        3'b100: Sal <= A & (~B) ;//FUNCION A AND ~B
        3'b101: Sal <= A | (~B) ;//FUNCION A OR ~B
        3'b110: Sal <= A - B ;//FUNCION A LESS B
        3'b111: Sal <= (A < B) ? 1:0 ;//FUNCION STL. REALIZA UNA COMPARACION ENTRE A Y B, SI A > B COLOCA 0000, SI A < B COLOCA 0001
      default: Sal <= 4'b0000 ;//POR DEFAULT QUE COLOQUE TODP EN 0
    endcase
  end
endmodule
