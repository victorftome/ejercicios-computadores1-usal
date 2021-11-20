module T(output reg Q, output wire nQ, input wire T, input wire nPRESET, input wire nCLEAR);
	initial Q = 0;
	not(nQ, Q);

	always @(negedge T)
		if (nPRESET && nCLEAR) Q = ~Q;

	always @(nPRESET, nCLEAR)
		case({nPRESET, nCLEAR})
			2'b01: Q = 1;
			2'b10: Q = 0;
		endcase
endmodule

module Thold(output wire Q, output wire nQ, input wire T, input wire nPRESET, input wire nCLEAR, input wire nHOLD);
	wire a1s, a2s, o1s, o2s;

	T t1(Q, nQ, T, a2s, a1s);

	or(o1s, nHOLD, Q);
	or(o2s, nHOLD, nQ);
	and(a1s, o1s, nCLEAR);
	and(a2s, o2s, nPRESET);
endmodule
