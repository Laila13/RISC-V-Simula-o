module data_memory_byte (
    input wire clk, MemWrite, MemRead,
    input wire [31:0] address, write_data,
    output reg [31:0] read_data
);
    reg [7:0] memory [1023:0];
    integer i;
    initial for (i=0; i<1024; i=i+1) memory[i] = 8'b0;
    always @(posedge clk) if (MemWrite) memory[address] <= write_data[7:0];
    always @(*) begin
        if (MemRead) read_data = {{24{memory[address][7]}}, memory[address]};
        else read_data = 32'hxxxxxxxx;
    end
endmodule
