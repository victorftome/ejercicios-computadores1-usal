`include "semisumador.v"

module FA(output wire S, output wire Co, input wire e1, input wire e2, input wire ci);
	wire HA1S, HA1C, HA2C;

	HA ha1(HA1S, HA1C, e1, e2);
	HA ha2(S, HA2C, ci, HA1S);

	or (Co, HA1C, HA2C);
endmodule

module test;
	reg [2:0] E;
	wire S, Co;

	FA sumador(S, Co, E[1], E[0], E[2]);

	initial
	begin
		$monitor($time, "| | %b + %b (%b) = %b (%b)", E[1], E[0], E[2], S, Co);
		E = 0;

		while(E != 'b111) #5 E += 1;
	end
endmodule
