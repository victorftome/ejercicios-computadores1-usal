module D(output reg Q, input wire D, input wire C);
	initial Q = 0;
	always @(negedge C) Q = D;
endmodule

module testD;
	reg [1:0] CD;
	wire Q;

	D d(Q, CD[0], CD[1]);

	always #7 CD[1] = ~CD[1];

	initial
	begin
		$monitor($time, " | | C: %b, D: %b, Q: %b", CD[1], CD[0], Q);
		$dumpfile("saluda.dmp");
		$dumpvars;

		CD[1] = 0;
		CD[0] = 0;

		#5 CD[0] = 1;
		#15 CD[0] = 0;
		#5 CD[0] = 1;
		#15 CD[0] = 0;
		#30
		#15 CD[0] = 1;
		#15 CD[0] = 0;

		$dumpoff;
		$finish;
	end
endmodule
