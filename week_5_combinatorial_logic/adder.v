module adder(
    // Declare your A/B inputs
    input A,B,
    // Declare Y output
    output Y,
    // Declare carry output
    output carry
);

    assign Y = A ^ B;
    assign carry = A & B;

endmodule