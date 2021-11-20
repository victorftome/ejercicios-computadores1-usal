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

module Contador4bitsJK(output wire [2:0] O, input wire C);
	wire [2:0] nQ;
	wire K0, K1;

	JKDown JK0(O[0], nQ[0], nQ[2], K0, C);
	JKDown JK1(O[1], nQ[1], 1'b1, K1, C);
	JKDown JK2(O[2], nQ[2], O[0], nQ[0], C);

	xor(K0, O[2], O[1]);
	and(K1, nQ[2], O[0]);
endmodule

module test;
	wire [2:0] O;
	reg C;

	Contador4bitsJK contador(O, C);

	always #5 C = ~C;

	initial
	begin
		$dumpfile("salida.dmp");
		$dumpvars;

		contador.JK0.Q <= 1; contador.JK1.Q <= 0; contador.JK2.Q <= 1;
		$monitor($time, " | | O: %b, C: %b, num: %d", O, C, O);
		C = 0;

		#120;

		$display("Inicial a 000");
		contador.JK0.Q <= 0; contador.JK1.Q <= 0; contador.JK2.Q <= 0;
		#120;

		$display("Inicial 001");
		contador.JK0.Q <= 1; contador.JK1.Q <= 1; contador.JK2.Q <= 1;
		#120;

		$display("Inicial 100");
                contador.JK0.Q <= 1; contador.JK1.Q <= 0; contador.JK2.Q <= 0;
                #120;


		$dumpoff;
		$finish;
	end
endmodule
