module RegFile(
    input clk, regWrite,
    input [3:0] rs, rt, rd,
    input [31:0] writeData,
    output [31:0] readData1, readData2
);
    reg [31:0] registers [0:15];
    assign readData1 = registers[rs];
    assign readData2 = registers[rt];

    always @(posedge clk) begin
        if (regWrite)
            registers[rd] <= writeData;
    end
endmodule
