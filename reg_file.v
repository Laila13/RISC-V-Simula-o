// reg_file.v
module reg_file (
    input  wire        clk,
    input  wire        RegWrite,
    input  wire [4:0]  rs1_addr,
    input  wire [4:0]  rs2_addr,
    input  wire [4:0]  rd_addr,
    input  wire [31:0] rd_data,
    output wire [31:0] rs1_data,
    output wire [31:0] rs2_data
);
    reg [31:0] registers [31:0];
    always @(posedge clk) begin
        if (RegWrite && (rd_addr != 5'b0)) begin
            registers[rd_addr] <= rd_data;
        end
    end
    assign rs1_data = (rs1_addr == 5'b0) ? 32'b0 : registers[rs1_addr];
    assign rs2_data = (rs2_addr == 5'b0) ? 32'b0 : registers[rs2_addr];
endmodule