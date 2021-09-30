module TestAnd;
	reg a,b;
	wire salidaAND, salidaOR, salidaNOT, salidaNAND, salidaNOR, salidaXOR, salidaXNOR, salidaBUF;
	and a1(salidaAND, a, b);
	or o1(salidaOR, a, b);
	not n1(salidaNOT, a);
	nand na1(salidaNAND, a, b);
	nor nor1(salidaNOR, a, b);
	xor xor1(salidaXOR, a, b);
	xnor xnor1(salidaXNOR, a, b);
	buf buffer1(salidaBUF, a);

	initial
	begin
		/*
		* Usamos monitor() ya que es similar al display
		* Lo que va a hacer es que cada vez que varie el valor de
		* a o b va a imprimir los datos por pantalla
		*/
		$monitor($time, " a=%1b, b=%1b, AND=%1b, OR=%1b, NOT=%1b, NAND=%1b, NOR=%1b, XOR=%1b, XNOR=%1b, BUF=%1b", a, b, salidaAND, salidaOR, salidaNOT, salidaNAND, salidaNOR, salidaXOR, salidaXNOR, salidaBUF);

		/*
		* A la hora de asignarlos tendremos que indicar la almohadilla
		* para indicar los instantes de tiempo que quiero esperar. En
		* este caso esperaremos 5 instantes de tiempo.
		*/
	       a = 0; b = 0;
	       #5 a = 0; b = 1;
	       #5 a = 1; b = 0;
	       #5 a = 1; b = 1;

	       #5 a = 'bx; b = 0;
	       #5 a = 'bx; b = 1;
	       #5 a = 0; b = 'bx;
	       #5 a = 1; b = 'bx;

	       #5 a = 'bz; b = 0;
	       #5 a = 'bz; b = 1;
	       #5 a = 0; b = 'bz;
	       #5 a = 1; b = 'bz;

	       #5 a = 'bx; b = 'bz;
	       #5 a = 'bx; b = 'bx;
	       #5 a = 'bz; b = 'bx;
	       #5 a = 'bz; b = 'bz;
	end
endmodule
