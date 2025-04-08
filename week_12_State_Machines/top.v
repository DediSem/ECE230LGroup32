module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    one_hot inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(led[0]),
        .State(led[6:2])
    );
    
    binary inst2(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(led[1]),
        .State0(led[7]),
        .State1(led[8]),
        .State2(led[9])
    );
    
    

endmodule