`include"biestableTHold.v"
module Contador4bits(output wire [3:0] O, input wire C, input wire DECnINC, input wire nHOLD);
	wire xor0s, xor1s, xor2s;

	xor(xor0s, O[0], DECnINC);
	xor(xor1s, O[1], DECnINC);
	xor(xor2s, O[2], DECnINC);

	Thold T1(O[0], , C, 1'b1, 1'b1, nHOLD);
	Thold T2(O[1], , xor0s, 1'b1, 1'b1, nHOLD);
	Thold T3(O[2], , xor1s, 1'b1, 1'b1, nHOLD);
	Thold T4(O[3], , xor2s, 1'b1, 1'b1, nHOLD);
endmodule

module test;
	wire [3:0] O;
	reg C, DECnINC, nHOLD;

	Contador4bits contador(O, C, DECnINC, nHOLD);

	always #5 C = ~C;

	initial
	begin
		$dumpfile("salida.dmp");
		$dumpvars;

		$monitor($time, " | | nHOLD: %b,  DECnINC: %b, C: %b, O: %b, %d", nHOLD,DECnINC, C, O, O);
		C = 0; DECnINC = 0; nHOLD = 1;

		$display("CRECIENTE");
		#50;
		#1 nHOLD = 0;
		#1 DECnINC = 1;
		#1 nHOLD = 1;

		$display("DECRECIENTE");
		#50;
		#1 nHOLD = 0;
		#1 DECnINC = 0;
		#1 nHOLD = 1;

		$display("CRECIENTE OTRA VEZ");
		#50;

		$dumpoff;
		$finish;
	end
endmodule
