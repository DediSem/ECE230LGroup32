// Implement module called full_adder
module full_adder(
    input A,
    input B,
    input cin,
    output Y,
    output carry
);
    assign Y = (~A & B & ~cin) | (A & ~B & ~cin) | (~A & ~ B & cin) | (A & B & cin);
    assign carry = (A & B) | (B & cin) | (A & cin);
    
    
endmodule