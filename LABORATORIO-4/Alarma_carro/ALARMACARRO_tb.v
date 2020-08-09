//ALARMA CARRO
//GABRIEL ALEXANDER FONG PENAGOS
//CARNE 19722
//Modulo TESTEBENCH

module testbench();

  reg AR1, SV1, SM1;                                                            //Creamos los registros para el modulo alarma_sopg
  reg AR11, SV11, SM11;                                                         //Creamos los registros para el modulo alarma_sopo
  reg AR2, SV2, SM2;                                                            //Creamos los registros para el modulo alarma_poso
  reg AR22, SV22, SM22;                                                         //Creamos los registros para el modulo alarma_posg
  reg AR3, SV3, SM3;                                                            //Creamos los registros para el modulo alarma_ko
  reg AR33, SV33, SM33;                                                            //Creamos los registros para el modulo alarma_kp
  wire AL1, AL11, AL2, AL22, AL33, AL3;                                         //Creamos nuestras salidas como wire

  alarma_sopg g1(AR1, SV1, SM1, AL1);
  alarma_sopo op1(AR11, SV11, SM11, AL11);
  alarma_poso op2(AR2, SV2, SM2, AL2);
  alarma_posg g2(AR22, SV22, SM22, AL22);
  alarma_ko   op3(AR3, SV3, SM3, AL3);
  alarma_kg   g3(AR33, SV33, SM33, AL33);

  initial begin                                                                 //INICIAMOS EL MODULO alarma_sopg
    $display("");
    $display(" ALARMA SOP GATELEVELM");
    $display(" AR SV SM | AL1");
    $display("----------|----");
    $monitor("%b  %b  %b | %b", AR1, SV1, SM1, AL1);
       AR1 = 0; SV1 = 0; SM1 = 0;
    #1 AR1 = 0; SV1 = 0; SM1 = 1;
    #1 AR1 = 0; SV1 = 1; SM1 = 0;
    #1 AR1 = 0; SV1 = 1; SM1 = 1;
    #1 AR1 = 1; SV1 = 0; SM1 = 0;
    #1 AR1 = 1; SV1 = 0; SM1 = 1;
    #1 AR1 = 1; SV1 = 1; SM1 = 0;
    #1 AR1 = 1; SV1 = 1; SM1 = 1;

    end

  initial begin                                                                 //INICIAMOS EL MODULO alarma_sopo
  #9
    $display("");
    $display(" ALARMA SOP BM");
    $display(" AR SV SM | AL1");
    $display("----------|----");
    $monitor("%b  %b  %b | %b", AR11, SV11, SM11, AL11);
       AR11 = 0; SV11 = 0; SM11 = 0;
    #1 AR11 = 0; SV11 = 0; SM11 = 1;
    #1 AR11 = 0; SV11 = 1; SM11 = 0;
    #1 AR11 = 0; SV11 = 1; SM11 = 1;
    #1 AR11 = 1; SV11 = 0; SM11 = 0;
    #1 AR11 = 1; SV11 = 0; SM11 = 1;
    #1 AR11 = 1; SV11 = 1; SM11 = 0;
    #1 AR11 = 1; SV11 = 1; SM11 = 1;

      end

  initial begin                                                                 //INICIAMOS EL MODULO alarma_poso
  #17
    $display("");
    $display(" ALARMA POS BM");
    $display(" AR SV SM | AL2");
    $display("----------|----");
    $monitor("%b  %b  %b | %b", AR2, SV2, SM2, AL2);
       AR2 = 0; SV2 = 0; SM2 = 0;
    #1 AR2 = 0; SV2 = 0; SM2 = 1;
    #1 AR2 = 0; SV2 = 1; SM2 = 0;
    #1 AR2 = 0; SV2 = 1; SM2 = 1;
    #1 AR2 = 1; SV2 = 0; SM2 = 0;
    #1 AR2 = 1; SV2 = 0; SM2 = 1;
    #1 AR2 = 1; SV2 = 1; SM2 = 0;
    #1 AR2 = 1; SV2 = 1; SM2 = 1;

      end

    initial begin                                                                 //INICIAMOS EL MODULO alarma_posg
    #25
    $display("");
    $display(" ALARMA POS GATELEVELM");
    $display(" AR SV SM | AL2");
    $display("----------|----");
    $monitor("%b  %b  %b | %b", AR22, SV22, SM22, AL22);
       AR22 = 0; SV22 = 0; SM22 = 0;
    #1 AR22 = 0; SV22 = 0; SM22 = 1;
    #1 AR22 = 0; SV22 = 1; SM22 = 0;
    #1 AR22 = 0; SV22 = 1; SM22 = 1;
    #1 AR22 = 1; SV22 = 0; SM22 = 0;
    #1 AR22 = 1; SV22 = 0; SM22 = 1;
    #1 AR22 = 1; SV22 = 1; SM22 = 0;
    #1 AR22 = 1; SV22 = 1; SM22 = 1;

          end

  initial begin                                                                 //INICIAMOS EL MODULO alarma_ko
  #33
    $display("");
    $display(" ALARMA KARNAUGH BM");
    $display(" AR SV SM | AL3");
    $display("----------|----");
    $monitor("%b  %b  %b | %b", AR3, SV3, SM3, AL3);
       AR3 = 0; SV3 = 0; SM3 = 0;
    #1 AR3 = 0; SV3 = 0; SM3 = 1;
    #1 AR3 = 0; SV3 = 1; SM3 = 0;
    #1 AR3 = 0; SV3 = 1; SM3 = 1;
    #1 AR3 = 1; SV3 = 0; SM3 = 0;
    #1 AR3 = 1; SV3 = 0; SM3 = 1;
    #1 AR3 = 1; SV3 = 1; SM3 = 0;
    #1 AR3 = 1; SV3 = 1; SM3 = 1;

        end

  initial begin                                                                 //INICIAMOS EL MODULO alarma_kg
  #41
    $display("");
    $display(" ALARMA KARNAUGH GATELEVELM");
    $display(" AR SV SM | AL3");
    $display("----------|----");
    $monitor("%b  %b  %b | %b", AR33, SV33, SM33, AL33);
       AR33 = 0; SV33 = 0; SM33 = 0;
    #1 AR33 = 0; SV33 = 0; SM33 = 1;
    #1 AR33 = 0; SV33 = 1; SM33 = 0;
    #1 AR33 = 0; SV33 = 1; SM33 = 1;
    #1 AR33 = 1; SV33 = 0; SM33 = 0;
    #1 AR33 = 1; SV33 = 0; SM33 = 1;
    #1 AR33 = 1; SV33 = 1; SM33 = 0;
    #1 AR33 = 1; SV33 = 1; SM33 = 1;

              end
  initial begin

      $dumpfile("ALARMACARRO_tb.vcd");
      $dumpvars(0, testbench);

  end

endmodule
