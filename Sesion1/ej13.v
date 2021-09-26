module ej13;
	reg [15:0] reg16;
	reg signed [15:0] reg16Signed;
	reg signed [7:0] reg8Signed;
	initial
	begin
		reg16 = 2323;
		$display ("Numero %d en un registro de 16bits\nHexadecimal : %h \nBinario : %b", reg16, reg16, reg16);

		reg16 = 16'b1111_1111_1111_1111;
		$display ("\n\nMayor numero en un registro de 16 bits sin signo. \nDecimal : %d \nBinario : %b \nHexadecimal : %h", reg16, reg16, reg16);

		reg16Signed = 6789;
		$display ("\n\nExpresion en binario del numero %d en un registro de 16bits con signo. \nBinario : %b", reg16Signed, reg16Signed);

		reg8Signed = -22;
		reg16Signed = reg8Signed;
		$display ("\n\nNumero %d en un registro de 8 bits y en uno de 16 bits. \n16Bits. \n\tDecimal : %d \n\tBinario : %b \n\n8Bits. \n\tDecimal : %d \n\tBinario : %b", reg8Signed, reg16Signed, reg16Signed, reg8Signed, reg8Signed);
	end
endmodule
