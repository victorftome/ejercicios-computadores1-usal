module Ej2T3NAND;
	reg [1:0] r;

	wire salida;

	nand(salida, r[1], r[0]);

	initial
	begin
		$monitor($time, " | %b %b | %b", r[1], r[0], salida);
		r = 0;
		while(r != 'b11) #5 r += 1;
	end
endmodule
