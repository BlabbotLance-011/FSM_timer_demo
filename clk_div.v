module clk_div(clk_out, clk_led, clk_in);
	input clk_in;
	output reg clk_out;
	output reg clk_led;

	parameter integer FREQ = 50_000_000;
	parameter integer PERIOD = 1; // period in seconds of each clock cycle
	localparam integer TICKS = (FREQ * PERIOD) / 2; // number of ticks per half cycle

	integer tick_count = 0;

	always @(posedge clk_in) begin
		if( tick_count == (TICKS-1) ) begin // -1 because we check before incrementing the actual value of ticks
			clk_out <= ~clk_out;
			clk_led <= ~clk_out;

			tick_count <= 0; // clear tick count
		end
		else tick_count <= tick_count + 1;
	end
endmodule
