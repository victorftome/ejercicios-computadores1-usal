`include "sumadorCompleto.v"

module Sum4bit(output wire [3:0]S, output wire Co, input wire [3:0] e1, input wire [3:0] e2, input wire Ci);

	wire fa0c, fa1c, fa2c;

	FA fa0(S[0], fa0c, e1[0], e2[0], Ci);
	FA fa1(S[1], fa1c, e1[1], e2[1], fa0c);
	FA fa2(S[2], fa2c, e1[2], e2[2], fa1c);
	FA fa3(S[3], Co, e1[3], e2[3], fa2c);
endmodule

module test;
	reg [8:0] E;
	integer SC;
	wire [3:0] S;
	wire Co;

	Sum4bit s4b(S, Co, E[7:4], E[3:0], E[8]);

	initial
	begin
		$monitor($time, " | | %b + %b (%b) = %b (%b) || %d + %d = %d", E[7:4], E[3:0], E[8], S, Co, E[7:4], E[3:0], S);
		E = 0;

		SC = E[7:4]+E[3:0]+E[8];

		while(E != 'b111111111) 
		begin
			#18;
			#1 if((16*Co+S) != SC)
				$display("ERROR");
			
			E += 1;
			SC = E[7:4]+E[3:0]+E[8];
		end
	end
endmodule
