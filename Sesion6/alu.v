`include "74181.v"

module Ej2;
	reg [3:0] A, B, S;
	reg M, CNb;

	wire [3:0] F;
	wire AEB, CN4b;

	Circuit74181 ALU(S, A, B, M, CNb, F, , , CN4b, AEB);

	initial
	begin
		// 5 + 7
		M = 0;
		S='b1001;
		A = 5; B = 7; CNb = 1;

		#5 $display("%d + %d = %d(%b)", A, B, F, ~CN4b);

		// 0011 AND 1101
		M = 1;
		S = 'b1011;
		A = 'b0011; B = 'b1101;
		#5 $display("%b AND %b = %b", A, B, F);
	end
endmodule
