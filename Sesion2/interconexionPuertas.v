module interConexionPuertas;
	reg [2:0] r;
	wire salida, ab;
	
	and a1(ab, r[2], r[1]);
	or o1(salida, ab, r[0]);

	initial
	begin
		$display("                       a b c | f2");
		$display("                     _____________");
		$monitor($time, " | %b %b %b | %b", r[2], r[1], r[0], salida);
		r = 0;
		while(r != 'b111) 
			#5 r = r + 1;
	end
endmodule
