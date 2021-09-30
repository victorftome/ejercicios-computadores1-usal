module ej9;
	reg [2:0] r;
	wire salida, na1s, na2s;

	nand na1(na1s, r[2], r[1]);
	nand na2(na2s, r[0]);
	nand na3(salida, na1s, na2s);

	initial
	begin
		$monitor($time, " | %b %b %b | %b", r[2], r[1], r[0], salida);
		r = 0;
		while(r != 'b111) #5 r = r + 1;
	end
endmodule
