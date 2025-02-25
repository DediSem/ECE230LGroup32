module twos_compliment(
    input[7:0] A, B,
    output[7:0] Y
);

    wire [7:0] carry;
    

    // First addition
    full_adder lsb(
        .A(~A[0]),
        .B(1),
        .Y(Y[0]),
        .Cin(1'b0), // Fix to zero
        .Cout(carry[0])
    );

    full_adder int(
        .A(~A[1]),
        .B(0),
        .Y(Y[1]),
        .Cin(carry[0]),
        .Cout(carry[1])
    );
    
    full_adder int1(
        .A(~A[2]),
        .B(0),
        .Y(Y[2]),
        .Cin(carry[1]),
        .Cout(carry[2])
    );
    
    full_adder int2(
        .A(~A[3]),
        .B(0),
        .Y(Y[3]),
        .Cin(carry[2]),
        .Cout(carry[3])
    );

    full_adder int3(
        .A(~A[4]),
        .B(0),
        .Y(Y[4]),
        .Cin(carry[3]), // Fix to zero
        .Cout(carry[4])
    );

    full_adder int4(
        .A(~A[5]),
        .B(0),
        .Y(Y[5]),
        .Cin(carry[4]),
        .Cout(carry[5])
    );
    
    full_adder int5(
        .A(~A[6]),
        .B(0),
        .Y(Y[6]),
        .Cin(carry[5]),
        .Cout(carry[6])
    );
    
    full_adder msb(
        .A(~A[7]),
        .B(0),
        .Y(Y[7]),
        .Cin(carry[6]),
        .Cout(carry[7])
    );
    


    

endmodule