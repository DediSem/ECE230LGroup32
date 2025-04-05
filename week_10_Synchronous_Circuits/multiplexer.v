module multiplexer(
    input [7:0] A,B,C,D,
    input [1:0] sel,
    input Enable,
    output [7:0] Y
);

   assign Y = Enable ? (
   sel == 2'b00 ? A:
   sel == 2'b01 ? B :
   sel == 2'b10 ? C : D) : 8'b00000000;
endmodule
