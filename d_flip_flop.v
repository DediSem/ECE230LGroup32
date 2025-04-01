module d_flip_flop(
    input D, Clk,
    output reg Q,
    output notQ
 );
 
 initial begin
    Q <= 0; 
 end
 
 always @(posedge Clk) begin
    Q <= D;
 end 
     
 assign notQ = ~Q;   
    
endmodule
