// data_memory_byte.v
module data_memory_byte (
    input  wire        clk,       input  wire        MemWrite,
    input  wire        MemRead,   input  wire [31:0] address,
    input  wire [31:0] write_data,output wire [31:0] read_data
);
    reg [7:0] mem [4095:0];
    assign read_data = MemRead ? {{24{mem[address][7]}}, mem[address]} : 32'bz;
    always @(posedge clk) begin
        if (MemWrite) mem[address] <= write_data[7:0];
    end
endmodule