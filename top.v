module top
#(
    parameter DIVIDE_BY = 17
)
(
    input [7:0] sw,
    input clk,
    input btnC,
    output [3:0] an,
    output [6:0] seg
);

	wire divClock;
    wire [3:0] AplusB;
    wire [3:0] AminusB;
    
    clock_div #(.DIVIDE_BY(DIVIDE_BY))clock (
      .clock(clk),
      .reset(btnC),
      .div_clock(divClock)
    );
    
    seven_seg_scanner scanner(
        .div_clock(divClock),
        .reset(btnC),
        .anode(an)
    );
    
    seven_seg_decoder decoder(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(AplusB),
        .AminusB(AminusB),
        .anode(an),
        .segs(seg)
    );

    math_block math(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(AplusB),
        .AminusB(AminusB)
    );

endmodule