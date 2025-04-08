module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
    
);

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
    
   
    demultiplexer8bit data_inst(
        .data(data),
        .sel(addr),
        .A(data_vec[0]),
        .B(data_vec[1]),
        .C(data_vec[2]),
        .D(data_vec[3])    
    );
    
    demultiplexer1bit store_inst(
        .data(store),
        .sel(addr),
        .A(store_vec[0]),
        .B(store_vec[1]),
        .C(store_vec[2]),
        .D(store_vec[3])    
    );
    
    multiplexer mem_inst(
        .A(mem_vec[0]),
        .B(mem_vec[1]),
        .C(mem_vec[2]),
        .D(mem_vec[3]),
        .sel(addr),
        .Enable(1'b1),
        .Y(memory)
    );
            
            
endmodule

