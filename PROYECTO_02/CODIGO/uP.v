//PROYECTO 02
//GABRIEL FONG

module PROGRAMCOUNTER(input wire clk, reset,enable,incPC,
                input wire [11:0]LOAD,
                output reg[11:0]PC);

  always @ (posedge clk, posedge reset ) begin //REALIZAMOS UN ALWAYS PARA QUE SE EJECUTE EN TODOO MOMENTO Y CAMBIE EN EL FLANCO DE RELOJ
  if (reset)  //RESETEA EL VALOR EN 0 LOS 12 BITS
    PC <= 12'b0;
  else if (incPC) //SI EL LOAD ES 1 COLOCAR EN LA SALIDA EL VALOR PRE-COLOCADO
  PC <= LOAD;
  else if (enable) //SI ENABLE ES 1 SUMA 1 EN CADA FLANCO DE RELOJ, SI NO NO SUMA
    PC <= PC + 1;
  end
endmodule

module PROGRAMROM (input wire [11:0]PC, // DIRECCION DE 12 BITS
  output wire [7:0]PROGRAM_BYTE); //TAMAÑO DEL DATO DE 8 BITS

  reg [7:0] MEM[0:4095]; //MEM ES DE TAMAÑO DE 2^12 = 4096 Y CREA EL ARREGLO PARA NUESTROS DATOS
  initial begin         //INICIAMOS LA LECTURA DE NUESTRA LISTA
    $readmemh("memory.list", MEM);//LEEMOS LOS VALORES DE LA LISTA EN BINARIO
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
module flipflopD (input wire clk, reset, enable, D,
                  output reg Q);

    always @ ( posedge clk, posedge reset ) begin
      if (reset)
        Q <= 1'b0;
      else if (enable)  //SI EL ENABLE == 1 DEJA PASAR EL VALOR DE D A LA SALIDA Q
        Q <= D;
    end
endmodule // flipflopD

module PHASE(input wire clk, reset, enable,//flipflopT
                output wire Q);

    wire D;
    not U1(D,Q); // TOMAMOS EL VALOR DE LA SALIDA Y XOR CON 1
    //SE UTILIZO LA XOR POR LA TABLA DE VERDAD, CUANDO EL DATO DE LA ENTRADA ES EL MISMO = 0, DIFERENTES = 1
    flipflopD U1(clk, reset, enable, D, Q);

endmodule
module BUSDRIVER (input wire [3:0]D,
                input wire enable,
                output wire [3:0]Y);
  assign Y = enable ? D : 4'bz;
 //si enable = 1 deja pasar el dato de D, sino en alta impedancia

endmodule // BUSDRIVER

module DECODE(input wire[6:0]IN,
              output reg [12:0]OUTS);//LA SALIDA SON TODAS LAS SENALES

    always @ ( IN ) begin
      casex(IN)
        7'bxxxxxx0: OUTS <= 13'b1000000001000;//any
        7'b00001x1: OUTS <= 13'b0100000001000;//JC
        7'b00000x1: OUTS <= 13'b1000000001000;// JC
        7'b00011x1: OUTS <= 13'b1000000001000;// JNC
        7'b00010x1: OUTS <= 13'b0100000001000;// JNC
        7'b0010xx1: OUTS <= 13'b0001001000010;// CMPI
        7'b0011xx1: OUTS <= 13'b1001001100000;// CMPM
        7'b0100xx1: OUTS <= 13'b0011010000010;// LIT
        7'b0101xx1: OUTS <= 13'b0011010000100;// IN
        7'b0110xx1: OUTS <= 13'b1011010100000;// LD
        7'b0111xx1: OUTS <= 13'b1000000111000;// ST
        7'b1000x11: OUTS <= 13'b0100000001000;// JZ
        7'b1000x01: OUTS <= 13'b1000000001000;// JZ
        7'b1001x11: OUTS <= 13'b1000000001000;// JNZ
        7'b1001x01: OUTS <= 13'b0100000001000;// JNZ
        7'b1010xx1: OUTS <= 13'b0011011000010;// ADDI
        7'b1011xx1: OUTS <= 13'b1011011100000;// ADDM
        7'b1100xx1: OUTS <= 13'b0100000001000;// JMP
        7'b1101xx1: OUTS <= 13'b0000000001001;// OUT
        7'b1110xx1: OUTS <= 13'b0011100000010;// NANDI
        7'b1111xx1: OUTS <= 13'b1011100100000;// NANDM
        default: OUTS <= 13'b1111111111111;

      endcase

    end
    //assign OUTSIG = OUTS;
endmodule

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
            output wire [3:0]ALU_OUT,
            output wire CARRY,ZERO); //SALIDA

  reg  [4:0]OUT5;
  always @ (ACCU,DATA_BUS,F ) begin
    case (F)
      3'b000: OUT5 <= ACCU;
      3'b001: OUT5 <= ACCU - DATA_BUS;
      3'b010: OUT5 <= DATA_BUS;
      3'b011: OUT5 <= ACCU + DATA_BUS;
      3'b100: OUT5 <= {1'b0, (ACCU ~& DATA_BUS)};
      default: OUT5 <= 5'b00000;
    endcase
  end
  assign ALU_OUT = OUT5[3:0];
  assign CARRY = OUT5[4];
  assign ZERO = ~(ALU_OUT[3]| ALU_OUT[2]| ALU_OUT[1]|ALU_OUT[0]);
  //assign ZERO = (OUT5 == 4'b0000) ? 1:0;

endmodule // ALU

module FLAGS (input wire clk, reset,enable,
              input wire [1:0]flags,
              output reg [1:0]out_flags);
    always @ ( posedge clk, posedge reset ) begin
      if (reset)
        out_flags<= 2'b0;

    else if (enable)  //SI EL ENABLE == 1 DEJA PASAR EL VALOR DE D A LA SALIDA Q
          out_flags <= flags;
        //out_flags[1]<= flags[1]; //Carry
        //out_flags[0]<= flags[0];//zero
    end
endmodule // FLAGS

module RAM(input wire csRAM,weRAM,
          input wire [11:0]address_RAM,
          inout wire [3:0]data_bus);
  reg[3:0] dataout;
  reg[3:0] MEM[0:4095];
  //ST
  always @ ( address_RAM or data_bus or weRAM ) begin
    if (csRAM && weRAM) begin
      MEM[address_RAM]<=data_bus;
    end
  end
  //LOAD
  always @ (address_RAM or csRAM) begin
    if (csRAM && !weRAM)begin
      dataout<= MEM[address_RAM];
    end
  end

  assign data_bus = (csRAM &! weRAM) ? dataout : 4'bz;

endmodule

module uP(input wire clock,reset,
          input wire [3:0]pushbuttons,
          output wire phase, c_flag, z_flag,
          output wire [3:0]instr, oprnd,accu, data_bus, FF_out,
          output wire [7:0]program_byte,
          output wire [11:0]PC,address_RAM);

  wire incPC, loadPC, loadA,loadFlags,csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut,flag_c,flag_z;
  wire enphase = 1;
  wire [2:0]S_A;//selector de la ALU
  wire [3:0]ALU_O;//salida de la ALU
  assign address_RAM = {oprnd,program_byte};
  assign nphase = ~phase;
  PROGRAMCOUNTER PROGCOUNT(clock,reset,incPC,loadPC,address_RAM,PC);
  PROGRAMROM ROM(PC,program_byte);
  FETCH Fetch(clock,reset,nphase,program_byte,instr,oprnd);
  BUSDRIVER B1(oprnd,oeOprnd,data_bus);
  PHASE Phase(clock,reset,enphase,phase);
  DECODE Deco({instr,c_flag,z_flag,phase},{incPC,loadPC,loadA,loadFlags,S_A,csRAM,weRAM,oeALU,oeIN,oeOprnd,loadOut});
  ACCUMULATOR Accu(clock, reset, loadA,ALU_O,accu);
  ALU alu(accu,data_bus,S_A,ALU_O,flag_c,flag_z);
  BUSDRIVER B2(ALU_O, oeALU,data_bus);
  FLAGS flag(clock, reset, loadFlags,{flag_c,flag_z},{c_flag,z_flag});
  BUSDRIVER Inputs(pushbuttons,oeIN,data_bus);
  ACCUMULATOR OUTPUTS(clock,reset,loadOut,data_bus,FF_out);
  RAM ram(csRAM,weRAM,address_RAM,data_bus);

endmodule
