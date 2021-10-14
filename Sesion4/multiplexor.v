module Multiplexor(input wire[3:0] D, input wire[1:0] S, input wire oe,  output tri y);
	wire ns1, ns0;
	wire na1s, na2s, na3s, na4s;
	wire xy;

	not(ns1, S[1]);
	not(ns0, S[0]);

	and(na1s, D[0], ns1, ns0);
	and(na2s, D[1], ns1, S[0]);
	and(na3s, D[2], S[1], ns0);
	and(na4s, D[3], S[1], S[0]);

	or(xy, na1s, na2s, na3s, na4s);
	bufif1(y, xy, oe);
endmodule

module Multiplexor8(input wire[7:0] D, input wire[2:0] S, output tri salida);
	wire ns2;
	not (ns2, S[2]);
	Multiplexor m1(D[3:0], S[1:0], ns2, salida);
	Multiplexor m2(D[7:4], S[1:0], S[2], salida);
endmodule

module TestMultiplexor;

	reg [7:0] D;
	reg [2:0] S;
	tri salida;
	Multiplexor8 m(D, S, salida);

	initial
	begin
		$monitor($time, " | D=%b | S=%b | salida=%b", D, S, salida);
		D = 'b1101_0111;
		S = 0;

		while (S != 'b111) #5 S += 1;

		#5 D = 'b0011_0111;
		S = 0;

		while(S != 'b111) #5 S += 1;
	end
endmodule
