`timescale 1ns / 1ps

module CPU32_TEST;

    reg CLK, Reset;
    wire [5:0] op;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [15:0] immediate;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [31:0] WriteData;
    wire DataMemRW;
    wire [31:0] DataOut;
    wire [31:0] OutAddr;
    wire [31:0] result;

    CPU32 cpu32(CLK, Reset, op, rs, rt, rd, immediate, ReadData1, ReadData2, WriteData, DataMemRW, DataOut, OutAddr, result);
	
	initial begin
		CLK = 0;
		Reset = 1;
		#50;
		CLK = ~CLK;
		#50;
		Reset = 0;
		forever #50 CLK = ~CLK;
	end

endmodule


