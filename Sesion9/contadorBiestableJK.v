module JKDown(output reg Q, output wire nQ, input wire J, input wire K, input wire C);
	initial Q = 0;
	not(nQ, Q);

	always @(negedge C)
		case ({J, K})
			2'b10: Q = 1;
			2'b01: Q = 0;
			2'b11: Q = ~Q;
		endcase
endmodule

module Contador4bitsJK(output wire [3:0] O, input wire C);
	wire O1O0, O2O1O0;

	and(O1O0, O[0], O[1]);
	and(O2O1O0, O[2], O1O0);

	JKDown JK0(O[0], , 1'b1, 1'b1, C);
	JKDown JK1(O[1], , O[0], O[0], C);
	JKDown JK2(O[2], , O1O0, O1O0, C);
	JKDown JK3(O[3], , O2O1O0, O2O1O0, C);
endmodule

module test;
	wire [3:0] O;
	reg C;

	Contador4bitsJK contador(O, C);

	always #5 C = ~C;

	initial
	begin
		$dumpfile("salida.dmp");
		$dumpvars;

		$monitor($time, " | | O: %b, C: %b, num: %d", O, C, O);
		C = 0;

		#300;

		$dumpoff;
		$finish;
	end
endmodule
