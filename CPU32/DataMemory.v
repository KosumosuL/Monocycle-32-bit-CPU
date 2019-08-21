`timescale 1ns / 1ps

module DataMemory(
	input CLK,
	input DataMemRW,
	input [31:0] DAddr,
	input [31:0] DataIn,
	output [31:0] DataOut
	);
	
	reg [7:0] memory[0:63];
	initial begin
		$readmemb("dm.txt", memory);
	end

	assign DataOut = {memory[DAddr], memory[DAddr + 1], memory[DAddr + 2], memory[DAddr + 3]};
	
	always@(negedge CLK) begin
		if (DataMemRW == 1) {memory[DAddr], memory[DAddr + 1], memory[DAddr + 2], memory[DAddr + 3]} <= DataIn;
		//else DataOut <= {memory[DAddr], memory[DAddr + 1], memory[DAddr + 2], memory[DAddr + 3]};
	end
	
	
endmodule

			