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

module Comp2(output wire mayor, output wire igual, output wire menor, input wire[1:0]a, input wire [1:0] b);
	wire mayor1, igual1, menor1, mayor2, igual2, menor2;
	wire as1, as2;

	Comp1 c1(mayor1, igual1, menor1, a[0], b[0]);
	Comp1 c2(mayor2, igual2, menor2, a[1], b[1]);

	and a1(as1, mayor1, igual2);
	and a2(as2, menor1, igual2);
	and a3(igual, igual1, igual2);

	or o1(mayor, as1, mayor2);
	or o2(menor, as2, menor2);
endmodule

module TestComp2;
	reg[3:0]r;

	wire mayor, igual, menor;
	Comp2 c(mayor, igual, menor, r[3:2], r[1:0]);

	initial
	begin
		r = 'b0000;

		$monitor($time, " | %b %b %b %b | %b %b %b", r[3], r[2], r[1], r[0], mayor, igual, menor);
		while(r != 'b1111) #5 r += 1;
	end
endmodule
