module ej7;
	reg [15:0] r;

	initial
	begin
		r=16'b1011_0011_1010_1011;
		$display("Bits originales: %b", r); // Original

		r = r | 16'b0000_0000_0001_0000;
		$display("Operacion |: %b", r);

		r = r & 16'b1111_1000_1111_1111;
		$display("Operacion &: %b", r);

		r = r ^ 16'b1000_0000_0000_0000;
		$display("Operacion ^: %b", r);
	end
endmodule
