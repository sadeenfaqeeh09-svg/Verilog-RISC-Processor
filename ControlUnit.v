module ControlUnit(
    input clk, reset,
    input [5:0] opcode,
    input zero,
    output reg PCWrite, IRWrite, RegWrite, MemRead, MemWrite,
    output reg ALUSrcA,
    output reg [1:0] ALUSrcB, PCSource,
    output reg [2:0] ALUControl,
    output reg MemtoReg, RegDst
);
    reg [3:0] state;

    parameter FETCH = 0, DECODE = 1, EXEC = 2, MEM = 3, WB = 4, BRANCH = 5, JUMP = 6;

    always @(posedge clk or posedge reset) begin
        if (reset) state <= FETCH;
        else begin
            case (state)
                FETCH: state <= DECODE;
                DECODE: begin
                    case (opcode)
                        0,1,2,3: state <= EXEC;
                        4,5: state <= EXEC;
                        6: state <= MEM;
                        7: state <= MEM;
                        10,11,12: state <= BRANCH;
                        14,15: state <= JUMP;
                        default: state <= FETCH;
                    endcase
                end
                EXEC: state <= WB;
                MEM: state <= WB;
                WB, BRANCH, JUMP: state <= FETCH;
                default: state <= FETCH;
            endcase
        end
    end

    always @(*) begin
        PCWrite = 0; IRWrite = 0; RegWrite = 0; MemRead = 0; MemWrite = 0;
        ALUSrcA = 0; ALUSrcB = 2'b00; ALUControl = 3'b000;
        PCSource = 2'b00; MemtoReg = 0; RegDst = 0;

        case (state)
            FETCH: begin
                MemRead = 1; ALUSrcB = 2'b01; ALUControl = 3'b000;
                PCWrite = 1; IRWrite = 1;
            end
            DECODE: begin
                ALUSrcA = 0; ALUSrcB = 2'b10; ALUControl = 3'b000;
            end
            EXEC: begin
                ALUSrcA = 1; ALUSrcB = 2'b00;
                case (opcode)
                    0: ALUControl = 3'b010; // OR
                    1: ALUControl = 3'b000; // ADD
                    2: ALUControl = 3'b001; // SUB
                    3: ALUControl = 3'b011; // CMP
                    4,5: ALUSrcB = 2'b11; // IMM
                endcase
            end
            MEM: begin
                ALUSrcA = 1; ALUSrcB = 2'b10; ALUControl = 3'b000;
                if (opcode == 6) MemRead = 1;
                else if (opcode == 7) MemWrite = 1;
            end
            WB: begin
                if (opcode <= 3) begin
                    RegDst = 1; RegWrite = 1;
                end else if (opcode == 6) begin
                    MemtoReg = 1; RegWrite = 1;
                end else if (opcode == 4 || opcode == 5) begin
                    RegWrite = 1;
                end
            end
            BRANCH: begin
                ALUSrcA = 1; ALUSrcB = 2'b00; ALUControl = 3'b001;
                if (zero) begin PCSource = 2'b01; PCWrite = 1; end
            end
            JUMP: begin
                PCSource = 2'b10; PCWrite = 1;
            end
        endcase
    end
endmodule
