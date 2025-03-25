`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 11:16:35 AM
// Design Name: 
// Module Name: multiplexer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplexer(
    input [3:0] A,B,C,D,
    input [1:0] sel,
    input Enable,
    output [7:0] Y
);

   assign Y = Enable ? 
   sel == 2'b00 ? A:
   sel == 2'b01 ? B :
   sel == 2'b10 ? C : D: 4'b0000;
endmodule
