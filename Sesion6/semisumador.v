module HA(output wire S, output wire C, input wire e1, input wire e2);
	xor (S, e1, e2);
	and (C, e1, e2);
endmodule

module test;
	reg [1:0] E;
	wire S, C;
	HA semisumador(S, C, E[1], E[0]);

	initial
	begin
		$monitor($time, " | | %b + %b = %b(%b)", E[1], E[0], S, C);
		E = 0;
		while(E != 'b11) #5 E += 1;
	end
endmodule
