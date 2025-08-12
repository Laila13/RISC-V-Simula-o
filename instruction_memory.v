// instruction_memory.v
module instruction_memory (
    input  wire [31:0] address,
    output wire [31:0] instruction
);
    reg [31:0] mem [1023:0];
    initial $readmemh("meu_programa_g7.hex", mem);
    assign instruction = mem[address[31:2]];
endmodule
