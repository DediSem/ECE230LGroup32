module binary(
    input w,
    input clk,
    input reset,
    output z, State0, State1, State2
);
 
    wire [2:0] Next;

    dff zero(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .reset(reset),
        .Q(State0)
    );

    dff one(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(reset),
        .Q(State1)
    );
    
    dff two(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(reset),
        .Q(State2)
    );

    assign z = (State2 & ~State1 & ~State0) | (~State2 & State1 & ~State0);
    assign Next[0] = (~State1 & ~State0 & ~w) | (~State1 & w & ~State2) | (State1 & State0 & ~w & ~State2) | (~State0 & w & ~State2);
    assign Next[1] = (~State1 & State0) | (State1 & ~State0) | (~State1 & ~State2 & w);
    assign Next[2] = (w & State2) | (w & State1 & State0);

endmodule