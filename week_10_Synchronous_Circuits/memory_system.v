module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
    
);

    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr
    
    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory
    wire [7:0] data_vec[3:0];
    wire [7:0] mem_vec[3:0];
    wire store_vec[3:0];
    genvar i;
    generate
        for ( i = 0; i < 4; i = i + 1) begin
            byte_memory inst(
                .data(data_vec[i]),
                .store(store_vec[i]),
                .memory(mem_vec[i])
            );
        end
    endgenerate
    
   
    demultiplexer data_inst(
        .data(data),
        .sel(addr),
        .A(data_vec[0]),
        .B(data_vec[1]),
        .C(data_vec[2]),
        .D(data_vec[3])    
    );
    
        demultiplexer store_inst(
        .data(store),
        .sel(addr),
        .A(store_vec[0]),
        .B(store_vec[1]),
        .C(store_vec[2]),
        .D(store_vec[3])    
    );
    
    multiplexer mem_inst(
        .A(store_vec[0]),
        .B(store_vec[1]),
        .C(store_vec[2]),
        .D(store_vec[3]),
        .sel(addr),
        .enable(1),
        .Y(memory)
    );
            
            
endmodule

