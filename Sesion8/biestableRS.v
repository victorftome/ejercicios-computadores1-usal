module RS(output reg Q, output wire NQ, input wire R, input wire S, input wire C, input wire nCLR);
	initial Q = 0;
	not(NQ, Q);

	always @(negedge C)
		if(nCLR)
			case({R, S})
				2'b01: Q = #1 1;
				2'b10: Q = #1 0;
			endcase

	always @(nCLR)
		if(!nCLR) Q = 0;
endmodule

module RS1bit(output wire O, input wire SP, input wire Is, input wire Ip, input wire C, input wire nCLR);
	wire nI, IsSP, IpNsp, nsp1, I;

	not(nsp1, SP);

	and(IsSP, Is, SP);
	and(IpNsp, Ip, nsp1);

	nor(nI, IsSP, IpNsp);

	not(I, nI);

	RS rs1(O, , nI, I, C, nCLR);
endmodule

module Reg4bit(output wire [3:0] O, input wire SP, input wire Is, input wire [3:0] Ip, input wire C, input wire CE, input wire nCLR);
	wire CCE;
	and(CCE, C, CE);

	RS1bit r3(O[3], SP, Is, Ip[3], CCE, nCLR);
	RS1bit r2(O[2], SP, O[3], Ip[2], CCE, nCLR);
	RS1bit r1(O[1], SP, O[2], Ip[1], CCE, nCLR);
	RS1bit r0(O[0], SP, O[1], Ip[0], CCE, nCLR);
endmodule

module test;

	wire [3:0] O;
	reg SP, Is;
	reg [3:0] Ip;
	reg C, CE, nCLR;

	Reg4bit rs(O, SP, Is, Ip, C, CE, nCLR);

	always #7 C = ~C;

	initial
	begin
		$monitor($time, " | | %b CLR: %b, CE: %b, C: %b, SnP: %b, Is: %b, Ip: %b, O: %b", O, nCLR, CE, C, SP, Is, Ip, O[0]);
		
		$dumpfile("salida.dmp");
		$dumpvars;

		nCLR = 0; C = 0; CE = 1; SP = 1; Ip = 'b1101; Is = 1;

		#5 nCLR = 1;
		$display("serie");
		#5 Is = 1;
		#50;
		#5 Is = 0;
		#30 nCLR = 0;

		$display("Clear");
		#5 nCLR = 1;

		$display("Paralelo");
		#5 SP = 0;
		#15;
		#5 nCLR = 0;

		$display("Clear");
		#5 nCLR = 1;

		$display("Paralelo sin CE");
		#10 SP = 0;
		#5 CE = 0;
		#25;

		$dumpoff;
		$finish;
	end
endmodule
