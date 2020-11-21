//LABORATORIO 9
//ELECTRONICA DIGITAL I
//GABRIEL ALEXANDER FONG PENAGOS 19722
//EJERCICIO 5
module ROM (input wire [6:0]Address,
            output reg [12:0]Y);
  always @(Address) begin

    case (Address)
      7'b0000000: Y = 13'b1000000001000 ;//primer caso con Don't cares
      7'b1000000: Y = 13'b1000000001000 ;
      7'b0100000: Y = 13'b1000000001000 ;
      7'b0010000: Y = 13'b1000000001000 ;
      7'b0001000: Y = 13'b1000000001000 ;
      7'b0000100: Y = 13'b1000000001000 ;
      7'b0000010: Y = 13'b1000000001000 ;
      7'b1111110: Y = 13'b1000000001000 ;
      7'b1111100: Y = 13'b1000000001000 ;
      7'b1111000: Y = 13'b1000000001000 ;
      7'b1110000: Y = 13'b1000000001000 ;
      7'b1100000: Y = 13'b1000000001000 ;
      7'b0111110: Y = 13'b1000000001000 ;
      7'b0011110: Y = 13'b1000000001000 ;
      7'b0001110: Y = 13'b1000000001000 ;
      7'b0000110: Y = 13'b1000000001000 ;
      7'b1011110: Y = 13'b1000000001000 ;
      7'b1001110: Y = 13'b1000000001000 ;
      7'b1000110: Y = 13'b1000000001000 ;
      7'b1000010: Y = 13'b1000000001000 ;
      7'b1101110: Y = 13'b1000000001000 ;
      7'b1100110: Y = 13'b1000000001000 ;
      7'b1100010: Y = 13'b1000000001000 ;
      7'b1110110: Y = 13'b1000000001000 ;
      7'b1110010: Y = 13'b1000000001000 ;
      7'b1111010: Y = 13'b1000000001000 ;
      7'b1111100: Y = 13'b1000000001000 ;//27 opciones para el primer caso
      7'b0000101: Y = 13'b0100000001000 ;//caso 2
      7'b0000111: Y = 13'b0100000001000 ;
      7'b0000001: Y = 13'b1000000001000 ;//caso 3
      7'b0000011: Y = 13'b1000000001000 ;
      7'b0001101: Y = 13'b1000000001000 ;//caso 4
      7'b0001111: Y = 13'b1000000001000 ;
      7'b0001001: Y = 13'b0100000001000 ;//caso 5
      7'b0001011: Y = 13'b0100000001000 ;
      7'b0010001: Y = 13'b0001001000010 ;//caso 6
      7'b0010011: Y = 13'b0001001000010 ;
      7'b0010101: Y = 13'b0001001000010 ;
      7'b0010111: Y = 13'b0001001000010 ;
      7'b0011001: Y = 13'b1001001100000 ;//caso 7
      7'b0011011: Y = 13'b1001001100000 ;
      7'b0011101: Y = 13'b1001001100000 ;
      7'b0011111: Y = 13'b1001001100000 ;
      7'b0100001: Y = 13'b0011010000010 ;//caso8
      7'b0100011: Y = 13'b0011010000010 ;
      7'b0100101: Y = 13'b0011010000010 ;
      7'b0100111: Y = 13'b0011010000010 ;
      7'b0101001: Y = 13'b0011010000100 ;//Caso 9
      7'b0101011: Y = 13'b0011010000100 ;
      7'b0101101: Y = 13'b0011010000100 ;
      7'b0101111: Y = 13'b0011010000100 ;
      7'b0110001: Y = 13'b1011010100000 ;//caso 10
      7'b0110011: Y = 13'b1011010100000 ;
      7'b0110101: Y = 13'b1011010100000 ;
      7'b0110111: Y = 13'b1011010100000 ;
      7'b0111001: Y = 13'b1000000111000 ;//caso 11
      7'b0111011: Y = 13'b1000000111000 ;
      7'b0111101: Y = 13'b1000000111000 ;
      7'b0111111: Y = 13'b1000000111000 ;
      7'b1000011: Y = 13'b0100000001000 ;//caso 12
      7'b1000111: Y = 13'b0100000001000 ;
      7'b1000001: Y = 13'b1000000001000 ;//caso 13
      7'b1000101: Y = 13'b1000000001000 ;
      7'b1001011: Y = 13'b1000000001000 ;//caso 14
      7'b1001111: Y = 13'b1000000001000 ;
      7'b1001001: Y = 13'b0100000001000 ;//caso 15
      7'b1001101: Y = 13'b0100000001000 ;
      7'b1010001: Y = 13'b0011011000010 ;//caso 16
      7'b1010011: Y = 13'b0011011000010 ;
      7'b1010101: Y = 13'b0011011000010 ;
      7'b1010111: Y = 13'b0011011000010 ;
      7'b1011001: Y = 13'b1011011100000 ;//caso 17
      7'b1011011: Y = 13'b1011011100000 ;
      7'b1011101: Y = 13'b1011011100000 ;
      7'b1011111: Y = 13'b1011011100000 ;
      7'b1100001: Y = 13'b0100000001000 ;//caso 18
      7'b1100011: Y = 13'b0100000001000 ;
      7'b1100101: Y = 13'b0100000001000 ;
      7'b1100111: Y = 13'b0100000001000 ;
      7'b1101001: Y = 13'b0000000001001 ;//caso 19
      7'b1101011: Y = 13'b0000000001001 ;
      7'b1101101: Y = 13'b0000000001001 ;
      7'b1101111: Y = 13'b0000000001001 ;
      7'b1110001: Y = 13'b0011100000010 ;//caso 20
      7'b1110011: Y = 13'b0011100000010 ;
      7'b1110101: Y = 13'b0011100000010 ;
      7'b1110111: Y = 13'b0011100000010 ;
      7'b1111001: Y = 13'b1011100100000 ;//caso21
      7'b1111011: Y = 13'b1011100100000 ;
      7'b1111101: Y = 13'b1011100100000 ;
      7'b1111111: Y = 13'b1011100100000 ;
      default:    Y = 13'bxxxxxxxxxxxxx ;
    endcase
  end


endmodule // ROM