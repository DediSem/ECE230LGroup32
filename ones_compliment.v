module ones_compliment(
    input [3:0] A, // Four bits of A: 3, 2, 1, 0
    input [3:0] B, // Same for B
    output [3:0] Y // and for Y
);

    wire [3:0] APlusB;
    wire [3:0] carry;
    wire [3:0] around;

    // First addition
    full_adder lsb(
        .A(A[0]),
        .B(B[0]),
        .Y(APlusB[0]),
        .Cin(1'b0), // Fix to zero
        .Cout(carry[0])
    );

    full_adder int(
        .A(A[1]),
        .B(B[1]),
        .Y(APlusB[1]),
        .Cin(carry[0]),
        .Cout(carry[1])
    );
    
    full_adder int1(
        .A(A[2]),
        .B(B[2]),
        .Y(APlusB[2]),
        .Cin(carry[1]),
        .Cout(carry[2])
    );
    
    full_adder msb(
        .A(A[3]),
        .B(B[3]),
        .Y(APlusB[3]),
        .Cin(carry[2]),
        .Cout(carry[3])
    );

    // Second addition
    full_adder lsb1(
        .A(APlusB[0]), // Adding LSB of (A + B)
        .B(1'b0), // We are adding 0, with the optional carry:
        .Y(Y[0]), // This is now the real summation
        .Cin(carry[3]), // Fix to zero
        .Cout(around[0]) // We still need to carry to second
        // bit of second addition
    );
    
    full_adder finalint(
        .A(APlusB[1]), // Adding LSB of (A + B)
        .B(1'b0), // We are adding 0, with the optional carry:
        .Y(Y[1]), // This is now the real summation
        .Cin(around[0]), // Fix to zero
        .Cout(around[1]) // We still need to carry to second
        // bit of second addition
    );
    
    full_adder finalint1(
        .A(APlusB[2]), // Adding LSB of (A + B)
        .B(1'b0), // We are adding 0, with the optional carry:
        .Y(Y[2]), // This is now the real summation
        .Cin(around[1]), // Fix to zero
        .Cout(around[2]) // We still need to carry to second
    );

    full_adder msb1(
        .A(APlusB[3]),
        .B(1'b0),
        .Y(Y[3]),
        .Cin(around[2])
    );


endmodule