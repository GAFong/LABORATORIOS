//LABORATORIO 10
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICO #2

//BUFFER TRIESTADO DE 4 BITS. 1 PARA LA ENTRADA B DE LA ALU (DATA BUS), OTRO PARA LA SALIDA DE LA ALU
module BUSDRIVER (input wire [3:0]D,
                input wire enable,
                output wire [3:0]Y);
  assign Y = enable ? D : 4'bz;
 //si enable = 1 deja pasar el dato de D, sino en alta impedancia

endmodule // BUSDRIVER

module ACCUMULATOR(input wire clk, reset, enable,
              input wire [3:0]ALUS,
              output reg [3:0]ACCU);
    always @ ( posedge clk, posedge reset ) begin
      if (reset) begin
        ACCU<= 4'b0;
      end
      else if (enable) begin //SI EL ENABLE == 1 DEJA PASAR EL VALOR DE D A LA SALIDA Q
        ACCU<= ALUS; //LOS 4 BITS DE LA SALIDA DE LA ALU SE DIRIGEN HACIA EL ACUMULADOR
      end
    end
endmodule

module ALU (input wire [3:0]ACCU,DATA_BUS, //ACCU = A  VIENE DEL ACUMULADOR  DATA_BUS = B VIENE DEL BUFFER DATA_BUS
            input wire [2:0]F,      //SELECTOR DE LAS OPERACIONES
            output wire [3:0]OUT,
            output wire CARRY,ZERO); //SALIDA

  reg  [4:0]OUT5;
  always @ (ACCU,DATA_BUS,F ) begin
    case (F)
      3'b000: OUT5 <= ACCU;
      3'b001: OUT5 <= ACCU - DATA_BUS;
      3'b010: OUT5 <= DATA_BUS;
      3'b011: OUT5 <= ACCU + DATA_BUS;
      3'b100: OUT5 <= (ACCU ~| DATA_BUS);
      default: OUT5 <= 5'b00000;
    endcase
  end
  assign OUT = OUT5[3:0];
  assign CARRY = OUT5[4];
  assign ZERO = (OUT5 == 5'b00000) ? 1:0;


endmodule // ALU

module PARTE2 (input wire clk, resetA,enableA, enableB1,enableB2,
               input wire [2:0]F,
               input wire [3:0]OPRND,
               output wire[3:0]OUT,
               output wire [3:0]DATA, ALUY, ACU,
               output wire CARRY, ZERO);
  wire [3:0]DATA_BUS, ALUS, ACCU;
  BUSDRIVER U1(OPRND, enableB1,DATA_BUS);
  BUSDRIVER U2(ALUS, enableB2, OUT);
  ACCUMULATOR U3(clk,resetA, enableA, ALUS,ACCU);
  ALU U4(ACCU, DATA_BUS, F,ALUS,CARRY, ZERO );
  assign DATA = DATA_BUS;
  assign ALUY = ALUS;
  assign ACU = ACCU;

endmodule // PARTE2
