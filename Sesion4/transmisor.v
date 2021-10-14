module Transceiver(inout tri a, inout tri b, input wire g, input wire dir);
	wire ng, ndir, ngndir, ngdir;

	not (ng, g);
	not (ndir, dir);

	and (ngndir, ng, ndir);
	and (ngdir, ng, dir);

	bufif1 (b, a, ngdir);
	bufif1 (a, b, ngndir);
endmodule

module TestTransceiver;
	tri a, b;
	reg g, dir, ra, rb;

	Transceiver transceiver(a, b, g, dir);
	assign a = ra;
	assign b = rb;

	initial
	begin
		$monitor($time, " | g=%b, dir=%b, a=%b, b=%b, ra=%b, rb=%b", g, dir, a, b, ra, rb);

		ra = 0; rb = 1; g = 1; dir = 0;
		#5 ra = 'bz; rb = 'bz; g = 1; dir = 0;
		#5 rb = 1; g = 0; dir = 0;
		#5 ra = 'bz; rb = 'bz; g = 1; dir = 1;
		#5 ra = 0; g = 0; dir = 1;
		#5 ra = 0; rb = 1; g = 0; dir = 1;
	end
endmodule
