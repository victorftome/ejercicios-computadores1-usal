module JKUp(output reg Q, output wire NQ, input wire J, input wire K,
input wire C, input wire nPRESET, input wire nCLEAR);
	not (NQ, Q);
	initial Q = 0;
	always @(posedge C)
	begin
		if(nPRESET && nCLEAR)
			case ({J, K})
				2'b01: Q = 0; // RESET
				2'b10: Q = 1; // SET
				2'b11: Q = ~Q; // Complemento
			endcase
	end
	always @(nPRESET, nCLEAR)
		case({nPRESET, nCLEAR})
			2'b01: Q = 1;
			2'b10: Q = 0;
		endcase
endmodule

module test;

	reg J, K, C, nPRESET, nCLEAR;
	wire Q, NQ;

	JKUp jk(Q, NQ, J, K, C, nPRESET, nCLEAR);

	always #15 C = ~C;

	initial
	begin
		$dumpfile("salida.dpm");
		$dumpvars;

		$monitor($time, " || J=%b, K=%b, C=%b, nPRESET=%b, nCLEAR=%b, Q=%b, NQ=%b", J, K, C, nPRESET, nCLEAR, Q, NQ);
		J=0; K=0; C=1; nPRESET=1; nCLEAR=0;
		#20 nCLEAR = 1;
		#20 J = 0; K = 1;
		#20 J = 0; K = 0;
		#20 J = 1; K = 0;
		#20 J <= 1; K <= 1;
		#20 K = 0; J = 0;
		#20 J = 1; K = 1;
		#20 K = 0; J = 0;
	
		$dumpoff;
		$finish;
	end
endmodule
