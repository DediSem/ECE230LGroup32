module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);

	wire [3:0] BNot;
    wire [2:0] carry_plus;
    wire [2:0] carry_minus;
    
    full_adder lsb(
        .A(A[0]),
        .B(B[0]),
        .Y(AplusB[0]),
        .Cin(1'b0), 
        .Cout(carry_plus[0])
    );
    
    full_adder b1(
        .A(A[1]),
        .B(B[1]),
        .Y(AplusB[1]),
        .Cin(carry_plus[0]), 
        .Cout(carry_plus[1])
    );
    
    full_adder b2(
        .A(A[2]),
        .B(B[2]),
        .Y(AplusB[2]),
        .Cin(carry_plus[1]), 
        .Cout(carry_plus[2])
    );
    
    full_adder msb(
        .A(A[3]),
        .B(B[3]),
        .Y(AplusB[3]),
        .Cin(carry_plus[2])
    );
    
    twos_compliment bnot(
        .A(B),
        .Y(BNot)
    );
    
    full_adder sub_lsb(
        .A(A[0]),
        .B(BNot[0]),
        .Y(AminusB[0]),
        .Cin(1'b0), 
        .Cout(carry_minus[0])
    );
    
    full_adder sub_b1(
        .A(A[1]),
        .B(BNot[1]),
        .Y(AminusB[1]),
        .Cin(carry_minus[0]), 
        .Cout(carry_minus[1])
    );
    
    full_adder sub_b2(
        .A(A[2]),
        .B(BNot[2]),
        .Y(AminusB[2]),
        .Cin(carry_minus[1]), 
        .Cout(carry_minus[2])
    );
    
    full_adder sub_msb(
        .A(A[3]),
        .B(BNot[3]),
        .Y(AminusB[3]),
        .Cin(carry_minus[2])
    );
    
endmodule