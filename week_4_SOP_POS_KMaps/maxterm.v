module minterm (
    input A, B, C, D,
    output Y
);

assign Y = (B&~D) | (~A&~B&D) | (C&~D);

endmodule
