module rom
(
	input[15:0] a,

	input re,
	input clk,

	output reg[7:0] q0, q1, q2, q3
);
	localparam SIZE = 32768;
	localparam READ_SIZE = 3;
	localparam WRITE_FILE = 0;

	reg[7:0] m[0:SIZE-1];

	initial
	begin
		$readmemh("/Users/connor/desktop/cpu-design/test.o", m);

		if (WRITE_FILE)
			for (integer i = 0; i < SIZE; i++)
				$display("%d: %h", i, m[i]);
	end

	// TODO: create PCU that allows for posedge access only
	always @(clk)
	begin
		if (a >= SIZE && a <= (16'hFFFF - READ_SIZE) && re)
		begin
			q0 <= m[a - SIZE + 0];
			q1 <= m[a - SIZE + 1];
			q2 <= m[a - SIZE + 2];
			q3 <= m[a - SIZE + 3];
		end

		else
		begin
			q0 <= 8'bz;
			q1 <= 8'bz;
			q2 <= 8'bz;
			q3 <= 8'bz;
		end
	end
endmodule
