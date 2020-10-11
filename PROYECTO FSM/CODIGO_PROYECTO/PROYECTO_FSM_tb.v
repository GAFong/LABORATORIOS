//PROYECTO MAQUINA DE ESTADOS FINITOS
//ELECTRONICA DIGITAL
//OCTUBRE DE 2020
//GABRIEL ALEXANDER FONG PENAGOS 19722
//TESTBENCH

module testbench ();
  //VARIABLES DE LA FSM1
  reg clk, reset1;
  real t;
  reg L, U, P, ST, ON; //ENTRADAS FSM1
  wire LI, UI;
  wire PP, PS, M, F;  //SALIDAS DE 1 BIT FSM1
  wire [1:0]TA;       //SALIDAS DE 2 BIT FSM1
  wire [2:0]SA1;       //ESTADOS ACTUALES
  wire [2:0]SF1;       //ESTADOS FUTUROS

  //VARIABLES DE LA FSM2
  reg SE;
  reg [2:0]BE;       //ENTRADA DE 3 BITS FSM2
  wire P2, ME;       //SALIDA DE 1 BIT FSM2
  wire [1:0]A;
  wire [1:0]SR;
  wire [1:0]PO;  //SALIDAS DE 2 BITS FSM2
  wire [2:0]SA2;
  wire [2:0]SF2;        //ESTADOS DE FSM2

  always  //REALIZAMOS LA SECUENCIA DEL CLK CAMBIO DE FLANCO DE 1 UNIDAD DE TIEMPO
   begin
    clk <= 0; #1 clk <= ~clk; #1;
  end
  always //ESTE CONTEO t SE UTILIZARA PARA MOSTRAR EN QUE UNIDAD DE TIEMPO SE ENCUENTRA Y SE PUEDA VISUALIZAR EN EL MONITOR
    begin
      t <= t + 1; #1;
  end

  antirebote U0(L, clk, reset1, LI);//FSM ANTIREBOTE PARA LOCKED
  antirebote U1(U, clk, reset1, UI);//FSM ANTIREBOTE PARA UNLOCKED
  FSM1 U2(clk, reset1, LI, UI, P, ST, ON, PP, PS, M, F, TA, SA1, SF1);//FSM 1
  FSM2 U3(clk, reset1, SE, BE, P2, ME, A, SR, PO, SA2, SF2);//FSM 2

  initial begin
  reset1 = 1;
  L = 0; U = 0; P = 0; ST = 0; ON = 0; t =0; //INICIALIZAMOS NUESTRAS ENTRADAS RESETEAMOS NUESTRAS FSM
  #1
  $display("\n");
  $display("ESTADO ACTUAL = SA \n ESTADO FUTURO = SF \n PP = PUERTA PILOTO \n PS = PUERTA SECUNDARIA \n M = MOTOR \n F = FUNCIONES ELECTRICAS \n TA = TABLERO");
  $display("t \t CLOCK \t   SA \t  SF \t PP \t PS \t M \t F \t TA ");
  $monitor("%d \t %b \t  %b \t %b \t %b \t %b \t %b \t %b \t %b" ,t, clk, SA1[2:0], SF1[2:0], PP, PS, M, F, TA[1:0]);
     reset1 = 0;
  #1 ST = 1;                   //INTENTAMOS ENCENDER EL MOTOR
  #2 ST = 0; ON = 1;           //INTENTAMOS ENCENDER LAS FUNCIONES
  #4 L = 1; ON = 0;            //COLOCAMOS SEGURO A PS
  #4 L = 0; U = 1;             //QUITAMOS SEGURO, DEJAMOS PASAR 4 UNIDADES DE TIEMPO PARA OBSERVAR SI LA FUNCION DE ANTIREBOTE DE L FUNCIONA
  #2 P = 1; U = 0;             //LA SEÑAL P NOS LLEVA S2, APAGAMOS LA ENTRAADA U PARA PODER ANTIVARLA DESPUES POR EL ANTIREBOTE
  #2 U = 1; P = 0;             //ACTIVAMOS U PARA IR A S1, LA SEÑAL P SE APAGA
  #2 L = 1;                    //ACTIVAMOS L PARA REGRESAR S2
  #2 ST = 1; P = 0; U = 0; L = 0;//ACTIVAMOS ST PARA ENCENDER EL MOTOR
  #2 ON = 1;                   //ACTIVAMOS LAS FUNCIONES
  #2 ST = 0;                   //APAGAMOS EL MOTOR, TAMBIEN SE APAGA LAS FUNCIONES
  #2 ST = 1; ON = 0;           //ENCENDEMOS EL MOTOR
  #2 ON = 1;                   //ENCENDEMOS LAS FUNCIONES
  #2 ON = 0;                   //APAGAMOS LAS FUNCIONES
  #2 ST = 0;                   //APAGAMOS EL MOTOR
  #2 U = 1;                    //QUITAMOS SEGURO EN PP S1
  #2 U = 0;                    //DEJAMOS DE PRESIONAR U
  #2 U = 1;                    //QUITAMOS SEGURO EN PS S0
  #2 U = 0;                    //DEJAMOS DE PRESIONAR U
  #2 U = 1; L = 1;             //SI PRESIONAMOS U Y L NO CAMBIAMOS DE ESTADO
  #2 U = 0; L = 0;
  #2 U = 1; P = 1;             //LA SEÑAL P TIENE PRIORIDAD ANTE LA SEÑAL U. VAMOS A S2
  #2 reset1 = 1; U = 0; P = 0;              //RESETEAMOS
  #1 reset1 = 0;
  #1 L = 1; P = 1;             //LA SEÑAL P TIENE PRIORIDAD ANTE L
  #2 L = 0; P = 0;
  #2 ST = 1;
  #2 ON = 1;
  end

  initial begin
  #60 //INICIAMOS LA FSM2
  SE = 0; BE[2:0] = 0; reset1 =1;
  $display("\n");
  $display("SA = ESTADO ACTUAL \n SF = ESTADO FUTURO \n A = ALARMA");
  $display("t \t CLOCK \t   SA \t  SF \t A \t SR \t PO \t ME \t P ");
    $monitor("%d \t %b \t  %b \t %b \t %b \t %b \t %b  \t %b \t %b"  ,t,clk, SA2[2:0], SF2[2:0], A[1:0], SR[1:0], PO[1:0], ME, P2);
  #2 BE = 3'b001; reset1 =0;    //CAMBIAMOS A ESTADO DE PANICO
  #2 BE = 3'b010;               //DE ESTADO DE PANICO CAMBIAMOS A EMERGENCIA
  #2 BE = 3'b011;               //DE ESTADO DE EMERGENCIA CAMBIAMOS BUSCAR
  #2 BE = 3'b100;               //DE ESTADO BUSCAR A MODO INCOGNITO
  #2 BE = 3'b101;               //DE ESTADO INCOGNITO A MODO ME ESTAN SIGUIENDO
  #2 BE = 3'b110;               // COMPROBAMOS QUE LA CODIFICACION 110 NO CAMBIA DE A NINGUN ESTADO POR QUE YA NO EXISTEN MAS EMERGENCIAS
  #2 BE = 3'b111;               //COMPROBAMOS QUE LA CODIFICACION 111 NO CAMBIA DE A NINGUN ESTADO
  #2 BE = 3'b000;               //REGRESAMOS AL ESTADO INICIAL
  #2 SE = 1;                    //SE ACTIVA EL SENSOR DE GOLPE VAMOS A S6
  #2 SE = 0;                    //APAGAMOS EL SENSOR PARA DEMOSTRAR UNA CONDICION DE SALIDA. SEGUIMOS EN S6
  #2 BE = 3'b000;               //SALIMOS DE S6 Y VAMOS A S0
  #2 SE = 1;                    //SE ACTIVA EL SENSOR DE GOLPE VAMOS A S6
  #2 BE = 3'b001;               //CON SE = 1 PODEMOS SALIR DE S6 Y VAMOS A MODO PANICO
  #2 SE = 0; BE = 3'b000;       //REGRESAMOS A CONDICION DE ESTADO INICIAL
  #2 SE = 1;                    //SE ACTIVA EL SENSOR DE GOLPE VAMOS A S6
  #2 BE = 3'b101;               //CON SE = 1 PODEMOS SALIR DE S6 Y VAMOS A MODO ME ESTAN SIGUIENDO
  #2 BE = 3'b000; SE = 0;       //REGRESAMOS A CONDICION DE ESTADO INICIAL
  #2 SE = 1;                    //SE ACTIVA EL SENSOR DE GOLPE VAMOS A S6
  #2 BE = 3'b010;               //COMPROBAMOS QUE CON LAS OTRAS CONFIGURACIONES NO LOGRAMOS SALIR DE S6
  #2 BE = 3'b011;
  #2 BE = 3'b100;
  #2 BE = 3'b101;               // SALIMOS DE S6 VAMOS A PROBAR LA MAYORIA DE CAMBIOS DE ESTADO
  #2 BE = 3'b001;               //DE ME ESTAN SIGUIENDO VAMOS A MODO PANICO
  #2 BE = 3'b011;               //DE PANICO VAMOS A BUSCAR
  #2 BE = 3'b101;               //DE BUSCAR A ME ESTAN SIGUIENDO
  #2 BE = 3'b001;               //DE ME ESTAN SIGUIENDO A PANICO
  #2 BE = 3'b100;               //DE PANICO A MODO INCOGNITO
  #2 BE = 3'b001;               //DE INCOGNITO A PANICO
  #2 BE = 3'b101;               //DE PANICO A ME ESTAN SIGUIENDO
  #2 BE = 3'b010;               //DE ME ESTAN SIGUIENDO A EMERGENCIA
  #2 BE = 3'b100;               //DE EMERGENCIA A MODO INCOGNITO
  #2 BE = 3'b010;               //DE INCOGNITO A EMERGENCIA
  #2 BE = 3'b101;               //DE EMERGENCIA A ME ESTAN SIGUIENDO
  #2 BE = 3'b011;               //DE ME ESTAN SIGUIENDO A BUSCAR
  #2 BE = 3'b101;               //DE A BUSCAR A ME ESTAN SIGUIENDO
  #2 BE = 3'b100;               //DE ME ESTAN SIGUIENDO A MODO INCOGNITO
  #2 $finish;
  end

  initial begin                                                                 //INICIAMOS PARA COLOCAR LOS DATOS EN GTK WAVE
        $dumpfile("PROYECTO_FSM_tb.vcd");
        $dumpvars(0, testbench);
      end
endmodule
