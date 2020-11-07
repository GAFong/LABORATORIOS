//LABORATORIO 10
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICO #1

module PROGRAMCOUNTER(input wire clk, reset,enable,loads,
                input wire [11:0]LOAD,
                output reg[11:0]PC);

  always @ (posedge clk, posedge reset ) begin //REALIZAMOS UN ALWAYS PARA QUE SE EJECUTE EN TODOO MOMENTO Y CAMBIE EN EL FLANCO DE RELOJ
  if (reset) begin //RESETEA EL VALOR EN 0 LOS 12 BITS
    PC <= 12'b0;
  end
  else if (loads)begin //SI EL LOAD ES 1 COLOCAR EN LA SALIDA EL VALOR PRE-COLOCADO
  PC <= LOAD;
end
else //SI ENABLE ES 1 SUMA 1 EN CADA FLANCO DE RELOJ, SI NO NO SUMA
  if (enable) begin
  PC <= PC + 1;
  end
end
endmodule

module PROGRAMROM (input wire [11:0]PC, // DIRECCION DE 12 BITS
  output wire [7:0]PROGRAM_BYTE); //TAMAÑO DEL DATO DE 8 BITS

  reg [7:0] MEM[0:4095]; //MEM ES DE TAMAÑO DE 2^12 = 4096 Y CREA EL ARREGLO PARA NUESTROS DATOS
  initial begin         //INICIAMOS LA LECTURA DE NUESTRA LISTA
    $readmemb("LISTAROM.list", MEM);//LEEMOS LOS VALORES DE LA LISTA EN BINARIO
  end
  assign PROGRAM_BYTE = MEM[PC]; //LE ASIGANMOS EL VALOR DE MEM EN LA DIRECCION INGRESADA
endmodule // ROM

//FLIPFLOP DE 8 BITS
module FETCH (input wire clk, reset, enable,
              input wire [7:0]PROGRAM_BYTE,
              output reg [3:0]INSTR,
              output reg [3:0]OPRND);
    always @ ( posedge clk, posedge reset ) begin
      if (reset) begin
        INSTR <= 4'b0;
        OPRND <= 4'b0;
      end
      else if (enable) begin //SI EL ENABLE == 1 DEJA PASAR EL VALOR DE D A LA SALIDA Q
        INSTR[3:0]<= PROGRAM_BYTE[7:4]; //LOS 4 BITS MAS SIGNIFICATIVOS SE DIRIGEN HACIA INSTR
        OPRND[3:0]<= PROGRAM_BYTE[3:0]; //LOS 4 BITS MENOS SIGNIFICATIVOS SE DIRIGEN HACIA OPRND
      end
    end
endmodule // FETCH

module Parte1 (input wire clk, reset, enableP, loads, enableF,
              input wire [11:0]LOAD,
              input wire[7:0]PROGRAM_BYTE,
              output wire [3:0]INSTR,OPRND);
    wire [11:0]PC;
    PROGRAMCOUNTER U1(clk,reset,enableP,loads,LOAD,PC);
    PROGRAMROM U2(PC,PROGRAM_BYTE);
    FETCH U3(clk,reset,enableF,PROGRAM_BYTE,INSTR,OPRND);

endmodule // Parte1
