module TopModule(input clk, input reset);
    wire [5:0] opcode;
    wire Zero;
    wire PCWrite, IRWrite, RegWrite, MemRead, MemWrite;
    wire ALUSrcA, MemtoReg, RegDst;
    wire [1:0] ALUSrcB, PCSource;
    wire [2:0] ALUControl;

    Datapath datapath(
        .clk(clk), .reset(reset),
        .PCWrite(PCWrite), .IRWrite(IRWrite), .RegWrite(RegWrite),
        .MemRead(MemRead), .MemWrite(MemWrite),
        .ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB), .PCSource(PCSource),
        .ALUControl(ALUControl), .MemtoReg(MemtoReg), .RegDst(RegDst),
        .opcode(opcode), .Zero(Zero)
    );

    ControlUnit control(
        .clk(clk), .reset(reset), .opcode(opcode), .zero(Zero),
        .PCWrite(PCWrite), .IRWrite(IRWrite), .RegWrite(RegWrite),
        .MemRead(MemRead), .MemWrite(MemWrite),
        .ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB), .PCSource(PCSource),
        .ALUControl(ALUControl), .MemtoReg(MemtoReg), .RegDst(RegDst)
    );
endmodule
