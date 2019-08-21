`timescale 1ns / 1ps

module PC(
	input CLK,
	input Reset,
	input PCWre,
	input [31:0] InAddr,
	output reg [31:0] OutAddr
	);
	
	initial begin
		OutAddr <= 0;
	end
	
	always@(posedge CLK or posedge Reset) begin
		if (Reset == 1) OutAddr <= 0;
		else OutAddr <= PCWre ? InAddr : OutAddr; 
	end

endmodule
