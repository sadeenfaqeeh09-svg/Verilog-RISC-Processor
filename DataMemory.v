module DataMemory(
    input clk, memRead, memWrite,
    input [31:0] address,
    input [31:0] writeData,
    output [31:0] readData
);
    reg [31:0] memory [0:255];
    assign readData = memRead ? memory[address] : 32'd0;

    always @(posedge clk) begin
        if (memWrite)
            memory[address] <= writeData;
    end
endmodule
