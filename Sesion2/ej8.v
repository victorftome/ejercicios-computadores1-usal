module ejemploPuertas;
	reg [2:0] r;
	wire salida, n1s, n2s, a1s, a2s, a3s, a4s, o1s, o2s;

	not n1(n1s, r[1]);
	not n2(n2s, r[0]);

	and a1(a1s, n1s, r[0]);
	and a2(a2s, r[1], r[0]);
	and a3(a3s, r[1], n2s);
	and a4(a4s, a3s, r[2]);

	or o1(o1s, r[0], a1s);
	or o2(o2s, a4s, a2s);
	or o3(salida, o1s, o2s);

	initial
	begin
		$monitor($time, " | %b %b %b | %b", r[2], r[1], r[0], salida);
		r = 0;
		while(r!='b111)
			#5 r = r + 1;
	end
endmodule
