//LABORATORIO 9
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 4

module buffer4 (input wire [3:0]D,
                input wire enable,
                output wire [3:0]Y);
  assign Y = enable ? D : 4'bz;
 //si enable = 1 deja pasar el dato de D, sino en alta impedancia
endmodule // buffer4
