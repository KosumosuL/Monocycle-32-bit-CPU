`timescale 1ns / 1ps

module Multiplexer32(
	input sentinel,
	input [31:0] in0,
	input [31:0] in1,
	output [31:0] out
	);
	
	assign out = sentinel ? in1 : in0;

endmodule
