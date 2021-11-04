module RS(output wire Q, output wire NQ, input wire R, input wire S);
	nor(Q, R, NQ);
	nor(NQ, S, Q);
endmodule

module test;
	reg R, S;
	wire Q, NQ;

	RS rs1(Q, NQ, R, S);

	initial
	begin
		$display("                     | R S | Q NQ");
		$monitor($time, " | %b %b | %b %b", R, S, Q, NQ);
		R = 0; S = 0;
		#5 R = 0; S = 1;
		#5 R = 0; S = 0;
		#5 R = 1; S = 0;
		#5 R = 1; S = 1;
		#5 R = 0; S = 0;
		#5 R = 1; S = 1;
		#5 S = 0; R = 0;
	end
endmodule
