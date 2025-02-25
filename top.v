module top(
    input [15:0] sw,
    output [15:0] led
);
    
    assign led[0] = ~sw[0];
    assign led[1] = sw[1] ^ led[0];   
    assign led[2] = sw[2] ^ led[1];
    assign led[3] = sw[3] ^ led[2];
    assign led[4] = sw[4] ^ led[3];
    assign led[5] = sw[5] ^ led[4];
    assign led[6] = sw[6] ^ led[5];
    assign led[7] = sw[7] ^ led[6];
    assign led[8] = sw[8] ^ led[7];
    assign led[9] = sw[9] ^ led[8];
    assign led[10] = sw[10] ^ led[9];
    assign led[11] = sw[11] ^ led[10];
    assign led[12] = sw[12] ^ led[11];
    assign led[13] = sw[13] ^ led[12];
    assign led[14] = sw[14] ^ led[13];
    assign led[15] = sw[15] ^ led[14];
    
endmodule