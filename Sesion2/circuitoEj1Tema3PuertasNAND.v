module Ej1T3NAND;
	reg [3:0] r;

	wire salida, na1s, na2s, na3s, na4s, na5s;

	// Puertas
	nand na1(na1s, r[3]);
	nand na2(na2s, na1s, r[2]);
	nand na3(na3s, r[1]);
	nand na4(na4s, na3s, na2s);
	nand na5(na5s, na4s, r[0]);
	nand na6(salida, na5s);

	initial
	begin
		$monitor($time, " | %b %b %b %b | %b", r[3], r[2], r[1], r[0], salida);
		r = 0;
		while(r != 'b1111) #5 r += 1;
	end
endmodule
