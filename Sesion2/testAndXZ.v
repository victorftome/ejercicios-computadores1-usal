module TestAnd;
	reg a,b; // Entradas
	wire salida; // El cable de salida donde se volcara el resultado
	and a1(salida, a, b); // La puerta and donde especificamos la entrada y la salida

	initial
	begin
		/*
		* Usamos monitor() ya que es similar al display
		* Lo que va a hacer es que cada vez que varie el valor de
		* a o b va a imprimir los datos por pantalla
		*/
		$monitor($time, " a=%1b, b=%1b, a.b=%1b", a, b, salida);

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
