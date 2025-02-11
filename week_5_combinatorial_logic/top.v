// Implement top level module
module top(
    input[7:0] sw,
    output[5:0] led
);
 
    light bob(
        .downstairs(sw[0]),
        .upstairs(sw[1]),
        .stair_light(led[0])
    
    );
    
    adder hi(
        .A(sw[2]),
        .B(sw[3]),
        .Y(led[1]),
        .carry(led[2])
    );
    
    wire carry;
    full_adder first(
        .A(sw[4]),
        .B(sw[6]),
        .cin(0),
        .Y(led[3]),
        .carry(carry)
    );
    
    full_adder second(
        .A(sw[5]),
        .B(sw[7]),
        .cin(carry),
        .Y(led[4]),
        .carry(led[5])
    );
endmodule