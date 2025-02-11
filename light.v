module light(
    // Declare downstairs and upstairs input
    input downstairs, 
    input upstairs,
    // Declare stair light output
    output stair_light 
);

    // Enter logic equation here
    assign stair_light = (downstairs ^ upstairs);

endmodule