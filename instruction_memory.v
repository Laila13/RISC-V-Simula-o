module instruction_memory (input wire [31:0] address, output wire [31:0] instruction);
    reg [31:0] memory [255:0];
    initial $readmemh("meu_programa_g7.hex", memory);
    assign instruction = memory[address >> 2];
endmodule
