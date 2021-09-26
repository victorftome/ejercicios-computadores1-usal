module ej20;
	reg [15:0] reg16;
	initial
	begin
		reg16 = 16'b0000_1111_xxxx_zzzz;
		$display ("Registro con x y z en binario %b", reg16);

		$display ("Operaciones con el registro. \n\t suma = %d \n\tresta = %d \n\tMultiplicacion = %d \n\tDivision = %d", reg16 + 1, reg16 - 1, reg16 * 1, reg16 / 1);
	end
endmodule
