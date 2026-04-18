module InstructionMemory(
    input [31:0] address,
    output [31:0] instruction
);
    reg [31:0] instr_mem [0:255];

	initial begin
	    instr_mem[0] = 32'h1500000A;  // ADDI R4, R0, 10
	    instr_mem[1] = 32'h1540000A;  // ADDI R5, R0, 10
	    instr_mem[2] = 32'h0CC52000;  // CMP  R6, R4, R5
	    instr_mem[3] = 32'h18C00002;  // BZ   R6, +2
	    instr_mem[4] = 32'h15C00063;  // ADDI R7, R0, 99 (should be skipped)
	    instr_mem[5] = 32'h16000001;  // ADDI R8, R0, 1
	end



    assign instruction = instr_mem[address];
endmodule
