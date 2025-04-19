module one_hot(
    input clk,
    input reset,
    output R, RC, LC, L,
    output [3:0] State
);
    wire [3:0] Next;
    

    dff Adff(
        .Default(1'b1),
        .D(Next[0]),
        .clk(clk),
        .reset(reset),
        .Q(State[0])
    );

    dff Bdff(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(reset),
        .Q(State[1])
    );

    dff Cdff(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(reset),
        .Q(State[2])
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(Next[3]),
        .clk(clk),
        .reset(reset),
        .Q(State[3])
    );

    assign R = ~State[0];
    assign RC = ~State[1];
    assign LC = ~State[2];
    assign L = ~State[3];
    
    assign Next[0] = State[0] & ~State[1] & ~State[2] & ~State[3];
    assign Next[1] = ~State[0] & State[1] & ~State[2] & ~State[3];
    assign Next[2] = ~State[0] & ~State[1] & State[2] & ~State[3];
    assign Next[3] = ~State[0] & ~State[1] & ~State[2] & State[3];
endmodule