module Datapath(
    input clk, reset,
    input PCWrite, IRWrite, RegWrite, MemRead, MemWrite,
    input ALUSrcA,
    input [1:0] ALUSrcB, PCSource,
    input [2:0] ALUControl,
    input MemtoReg, RegDst,
    output [5:0] opcode,
    output Zero
);
    reg [31:0] PC, IR, MDR, A, B, ALUOut;
    wire [31:0] instr, aluResult, memData, regData1, regData2, writeData, srcA, srcB;
    wire [3:0] rs = IR[25:22], rt = IR[21:18], rd = IR[17:14];
    wire [13:0] imm = IR[13:0];
    wire [31:0] signImm = {{18{imm[13]}}, imm};

    InstructionMemory imem(PC, instr);
    assign opcode = instr[31:26];

    RegFile rf(clk, RegWrite, rs, rt, RegDst ? rd : rt, writeData, regData1, regData2);

    DataMemory dmem(clk, MemRead, MemWrite, ALUOut, B, memData);

    ALU alu(srcA, srcB, ALUControl, aluResult, Zero);

    assign srcA = ALUSrcA ? A : PC;
    assign srcB = (ALUSrcB == 2'b00) ? B :
                  (ALUSrcB == 2'b01) ? 32'd1 :
                  (ALUSrcB == 2'b10) ? signImm : {18'b0, imm};

    assign writeData = MemtoReg ? MDR : ALUOut;

    always @(posedge clk or posedge reset) begin
        if (reset) begin PC <= 0; end
        else if (PCWrite) begin
            case (PCSource)
                2'b00: PC <= aluResult;
                2'b01: PC <= PC + signImm;
                2'b10: PC <= signImm;
            endcase
        end

        if (IRWrite) IR <= instr;
        A <= regData1;
        B <= regData2;
        ALUOut <= aluResult;
        if (MemRead) MDR <= memData;
    end
endmodule
