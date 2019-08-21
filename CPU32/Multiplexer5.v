`timescale 1ns / 1ps

module Multiplexer5(
	input sentinel,
	input [4:0] in0,
	input [4:0] in1,
	output [4:0] out
	);
	
	assign out = sentinel ? in1 : in0;

endmodule
