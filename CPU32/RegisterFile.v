`timescale 1ns / 1ps

module RegisterFile(
	input CLK,
	input RegWre,
	input [4:0] ReadReg1,
	input [4:0] ReadReg2,
	input [4:0] WriteReg,
	input [31:0] WriteData,
	output [31:0] ReadData1,
	output [31:0] ReadData2
	);
	
	reg [31:0] register[0:15];
	initial begin
		$readmemb("reg.txt", register);
	end
	
	assign ReadData1 = register[ReadReg1];
	assign ReadData2 = register[ReadReg2];
	
	always@(negedge CLK) begin
		if (RegWre && WriteReg != 0) register[WriteReg] = WriteData;
	end
	
endmodule
	
	