module D(output reg Q, input wire D, input wire C, input wire nCLR);
	initial Q = 0;
	always @(negedge C)
		if (nCLR) Q = #1 D;
	always @(nCLR)
		if(!nCLR) Q = 0;
endmodule

module SISO4bits(output wire O, input wire I, input wire C, input wire nCLR);

	wire d3s, d2s, d1s;

	D d0(O, d1s, C, nCLR);
	D d1(d1s, d2s, C, nCLR);
	D d2(d2s, d3s, C, nCLR);
	D d3(d3s, I, C, nCLR);
endmodule

module testD;
	reg [1:0] CD;
	reg nClear;
	wire Q;

	SISO4bits d(Q, CD[0], CD[1], nClear);

	always #7 CD[1] = ~CD[1];

	initial
	begin
		$monitor($time, " | | %b%b%b%b  | C: %b, I: %b, nCLR: %b, Q: %b", d.d3.Q, d.d2.Q, d.d1.Q, d.d0.Q, CD[1], CD[0], nClear, Q);
		$dumpfile("salida.dmp");
		$dumpvars;

		CD[1] = 0;
		CD[0] = 0;
		nClear = 1;

		#5 CD[0] = 1;
		#30
		#5 nClear = 0;
		#5 nClear = 1;
		#15 CD[0] = 1;
		#15 CD[0] = 0;
		#65

		nClear = 0; CD[0] = 1;
		#12 nClear = 1;
		#14 CD[0] = 0;
		#14 CD[0] = 1;
		#14 CD[0] = 0;
		#14 CD[0] = 1;
		#14 CD[0] = 1;
		#14 CD[0] = 1;
		#14 CD[0] = 0;
		#14 CD[0] = 0;
		#15
		$dumpoff;
		$finish;
	end
endmodule
