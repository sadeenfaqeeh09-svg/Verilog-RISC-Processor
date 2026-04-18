module Testbench;
    reg clk = 0;
    reg reset = 1;

    TopModule uut(clk, reset);

    initial begin
        $dumpfile("cpu_wave.vcd");
        $dumpvars(0, uut);
        #10 reset = 0;
        #1000 $finish;
    end

    always #5 clk = ~clk;
endmodule
