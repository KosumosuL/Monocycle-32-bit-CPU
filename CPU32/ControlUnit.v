`timescale 1ns / 1ps

`define ADD 6'b000000
`define ADDI 6'b000001
`define SUB 6'b000010
`define SUBI 6'b000011
`define SLT 6'b000100
`define SLTI 6'b000101
`define AND 6'b000110
`define ANDI 6'b000111
`define LUI 6'b001000
`define NOR 6'b001001
`define NORI 6'b001010
`define OR 6'b001011
`define ORI 6'b001100
`define XOR 6'b001101
`define XORI 6'b001110
`define SLLV 6'b001111
`define SRAV 6'b010000
`define SRLV 6'b010001
`define BEQ 6'b010010
`define BNE 6'b010011
`define LW 6'b010100
`define SW 6'b010101

`define ALU_ADD 4'b0000
`define ALU_SUB 4'b0001
`define ALU_SLT 4'b0010
`define ALU_AND 4'b0011
`define ALU_LUI 4'b0100
`define ALU_NOR 4'b0101
`define ALU_OR  4'b0110
`define ALU_XOR 4'b0111
`define ALU_SLL 4'b1000
`define ALU_SRA 4'b1001
`define ALU_SRL 4'b1010

module ControlUnit(
	input [5:0] op,
	input zero,
	output reg InsMemRW,
	output reg PCWre,
	output reg ExtSel,
	output reg DataMemRW,
	output reg ALUM2Reg,
	output reg ALUSrcB,
	output reg PCSrc,
	output reg [3:0] ALUOp,
	output reg RegWre,
	output reg RegOut
	);

    initial begin
		{PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = 13'b0; 
    end
	
	always@(op or zero) begin
		case(op)
			`ADD : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b100100001, `ALU_ADD};
			`ADDI : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b110100100, `ALU_ADD};
			`SUB : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b100100001, `ALU_SUB};
			`SUBI : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b110100100, `ALU_SUB};
			`SLT : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b100100001, `ALU_SLT};
			`SLTI : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b110100100, `ALU_SLT};
			`AND : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b100100001, `ALU_AND};
			`ANDI : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b110100000, `ALU_AND};
			`LUI : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b110100000, `ALU_LUI};
			`NOR : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b100100001, `ALU_NOR};
			`NORI : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b110100000, `ALU_NOR};
			`OR : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b100100001, `ALU_OR};
			`ORI : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b110100000, `ALU_OR};
			`XOR : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b100100001, `ALU_XOR};
			`XORI : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b110100000, `ALU_XOR};
			`SLLV : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b100100001, `ALU_SLL};
			`SRAV : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b100100001, `ALU_SRA};
			`SRLV : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b100100001, `ALU_SRL};
			`BEQ : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {7'b1000001, zero, 1'b0, `ALU_SUB};
			`BNE : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {7'b1000001, ~zero, 1'b0, `ALU_SUB};
			`LW : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b111100100, `ALU_ADD};
			`SW : {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = {9'b111001100, `ALU_ADD};
			default: {PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp} = 13'b0;
		endcase
	end
	
endmodule
