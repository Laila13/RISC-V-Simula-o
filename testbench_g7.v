// testbench_g7.v
`timescale 1ns/1ps
module testbench_g7;
    reg clk;
    reg rst;
    riscv_processor_g7 dut (.clk(clk), .rst(rst));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, dut);
        rst = 1; #20; rst = 0;
        #200;
        $display("Simulacao finalizada.");
        $finish;
    end
endmodule
