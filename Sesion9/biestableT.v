module T(output reg Q, input wire T);
	initial Q = 0;

	always @(negedge T) Q = ~Q;
endmodule
