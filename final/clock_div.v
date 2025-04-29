module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output div_clock
);

    wire [DIVIDE_BY - 1 :0] d;
    wire [DIVIDE_BY - 1 :0] clkdiv;
    
    dff dffinst(
        .Default(1'b0),
        .reset(reset),
        .clk(clock),
        .D(d[0]),
        .Q(clkdiv[0]),
        .NotQ(d[0])
        );
    
    genvar i;
    generate
		for (i = 1; i < DIVIDE_BY; i = i + 1) begin
			dff d_ff (
				.Default(1'b0),
                .reset(reset),
                .clk(clkdiv[i-1]),
                .D(d[i]),
                .Q(clkdiv[i]),
                .NotQ(d[i])
            );             
        end
endgenerate;

assign div_clock = clkdiv[DIVIDE_BY - 1];
 
endmodule