module Decoder2to4 (Din,Dout);
input [1:0] Din;
output [3 : 0] Dout;

assign {Dout} = 
( {Din} == 2'b00) ? 4'b0001 : 

( {Din} == 2'b01) ? 4'b0010 : 

( {Din} == 2'b10) ? 4'b0100 : 

( {Din} == 2'b11) ? 4'b1000 : 

 4'b1111;

endmodule





