module jk_flip_flop(
    input J, K, Clk,
    output Q, notQ
);

wire D;
assign D = (J&~Q) | (~K&Q) ; 


d_flip_flop inst(
    .D(D),
    .Clk(Clk),
    .Q(Q),
    .notQ(notQ)
);


endmodule