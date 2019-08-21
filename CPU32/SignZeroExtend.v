`timescale 1ns / 1ps

module SignZeroExtend(
	input ExtSel,
	input [15:0] immediate,
	output [31:0] extended
	);
	
	assign extended = {{16{ExtSel & immediate[15]}}, immediate};
	
endmodule
