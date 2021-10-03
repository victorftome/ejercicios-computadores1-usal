module circuitoEj2T13;
	reg [1:0] r;

	wire n1s, n2s, a1s, a2s, a3s, o1s, salida;

	// Puertas
	not n1(n1s, r[1]);
	not n2(n2s, r[0]);

	and a1(a1s, n1s, n2s);
	and a2(a2s, r[1], n2s);
	and a3(a3s, n1s, r[0]);

	or o1(o1s, a1s, a2s);
	or o2(salida, o1s, a3s);

	initial
	begin
		$monitor($time, " | %b %b | %b", r[1], r[0], salida);
		r = 0;
		while(r != 'b11) #5 r += 1;
	end
endmodule
