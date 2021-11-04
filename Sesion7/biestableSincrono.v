`include "biestable.v"
module RS_C(output wire Q, output wire NQ, input wire R, input wire S, input wire C);
	wire RC, SC;
	and(RC, R, C);
	and(SC, C, S);

	RS rs1(Q, NQ, RC, SC);
endmodule

module test;
	reg R, S, C;
	wire Q, NQ;
	RS_C rs_c1(Q, NQ, R, S, C);

	always #7 C = ~C;
	initial
	begin
		$dumpfile("usal.dpm");
		$dumpvars;
		$monitor($time, " || C=%b R=%b S=%b | Q=%b NQ=%b", C, R, S, Q, NQ);
		C = 0;
		R=0; S=0;
		#5 R=0; S=1;
		#5 R=0; S=0;
		#5 R=1; S=0;
		#5 R=1; S=1;
		#5 R=0; S=0;
		#5 R=1; S=1;
		#5 S=0; R=0;

		$dumpoff;
		$finish;
	end
endmodule
