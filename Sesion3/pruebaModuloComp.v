module Comp1(output wire mayor, 
	output wire igual, 
	output wire menor,
	input wire a,
	input wire b
);
	wire na, nb;

	not n1(na, a);
	not n2(nb, b);

	and a1(mayor, a, nb);
	and a2(menor, b, na);
	nor no1(igual, mayor, menor);
endmodule

module TestComp1;
	reg a, b;
	wire mayor, igual, menor;

	Comp1 c(mayor, igual, menor, a, b);

	initial
	begin
		$monitor($time, " | %b %b | %b %b %b", a, b, mayor, igual, menor);
		a = 0; b = 0;
		#5 a = 0; b = 1;
		#5 a = 1; b = 0;
		#5 a = 1; b = 1;
	end
endmodule
