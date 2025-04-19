module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output div_clock
);

    wire [16:0] d;
    wire [16:0] clkdiv;
    
    genvar i;
    generate
    for (i = 0; i < DIVIDE_BY; i = i + 1)
    begin
        tff inst(
            .Clk(clock),
            .reset(reset),
            .T(d[i]),
            .Q(clkdiv[i])
        );
        end
endgenerate;

assign div_clock = clkdiv[DIVIDE_BY];
 
endmodule