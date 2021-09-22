// Ejemplo Sacar variables por pantalla ejemploPunto9.v

module punto9;
	// Creamos una variable entera y otra real
	integer i;
	real f;

	initial
	begin
		i = 4;
		f = 2.7172;
		$display("i vale %0d y f vale %g", i, f);
	end
endmodule