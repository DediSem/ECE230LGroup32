// Implement module called full_adder
module full_adder(
    input A,
    input B,
    input Cin,
    output Y,
    output Cout
);
    assign Y = (~A & B & ~Cin) | (A & ~B & ~Cin) | (~A & ~ B & Cin) | (A & B & Cin);
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
    
    
endmodule