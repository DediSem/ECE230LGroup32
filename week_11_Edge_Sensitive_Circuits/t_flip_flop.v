module t_flip_flop(
    input T, Clk,
    output Q, notQ
);
    
    jk_flip_flop inst(
        .J(T),
        .K(T),
        .Clk(Clk),
        .Q(Q),
        .notQ(notQ)
    );
    
    
endmodule