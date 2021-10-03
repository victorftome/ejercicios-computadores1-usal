module circuitoEj1T3;
	reg [3:0] r;
	wire n1s, a1s, o1s, salida;

	// Puertas logicas
	not n1(n1s, r[3]);
	and a1(a1s, n1s, r[2]);
	and a2(salida, o1s, r[0]);
	or o1(o1s, a1s, r[1]);

	initial
	begin
		$monitor($time, " | %b %b %b %b | %b", r[3], r[2], r[1], r[0], salida);
		r = 0;
		while(r != 'b1111) #5 r = r + 1;
	end
endmodule
