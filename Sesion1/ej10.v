/* Primera posible solucion
module ej10;
	reg [7:0] r8;
	initial
	begin
		r8 = 8'b0010_0110;
		$display("Binario sin BIT de paridad: %b", r8);

		r8[7] = ^r8[6:0];
		$display("Binario con el BIT de paridad calculado: %b", r8);
	end
endmodule
*/

module ej10;
	reg [7:0] r8;
	reg [7:0] paridad;

	initial
	begin
		r8 = 8'b0010_0110;
		$display("Binario sin BIT de paridad: %b", r8);

		paridad = ^r8; // Optenemos el bit de paridad que se almacena en la posicion 0
		paridad = paridad << 7; // Movemos el bit 7 posicion para que se encuentre en la primera

		r8 = r8 | paridad; // Hacemos un | usando el bit de paridad sobre los datos.

		$display("Binario con el BIT de paridad calculado: %b", r8);
	end
endmodule
