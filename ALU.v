module ALU(
    input [31:0] A, B,
    input [2:0] ALUControl,
    output reg [31:0] ALUResult,
    output Zero
);
    always @(*) begin
        case (ALUControl)
            3'b000: ALUResult = A + B;
            3'b001: ALUResult = A - B;
            3'b010: ALUResult = A | B;
            3'b011: begin
                if (A == B) ALUResult = 32'd0;
                else if (A < B) ALUResult = -32'd1;
                else ALUResult = 32'd1;
            end
            default: ALUResult = 32'd0;
        endcase
    end

    assign Zero = (ALUResult == 0);
endmodule
