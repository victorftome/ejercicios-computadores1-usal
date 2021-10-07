module CodNormal(
	output wire[1:0] valor,
	input wire [3:0] a
);
	nor(valor[1], a[0], a[1]);
	nor(valor[0], a[0], a[2]);
endmodule

module CodPrioridad(
	output wire [1:0] valor,
	input wire [3:0] a
);
	wire ns, as;
	
	not(ns, a[2]);

	and(as, a[1], ns);
	or(valor[1], a[2], a[3]);
	or(valor[0], a[3], as);
endmodule

module Test;
	reg [3:0] r;
	wire[1:0] codS, codC;

	CodNormal cn(codS, r);
	CodPrioridad cp(codC, r);

	initial
	begin
		r = 0;

		$monitor($time, " | Entrada=%b Cod4x2=%b Cod4x2P=%b", r, codS, codC);

		while(r != 'b1111) #5 r += 1;
	end
endmodule
