module testbench;
	reg in;
	reg rst;
	wire[0:6] hex10s;
	wire[0:6] hex;
	wire out;
	
	reg clk_in; // clock from cpld
	
	wire clk_led; // led indicator for clock
	
	
	
	//wire[3:0] state;
	//wire clk; // divided clock to be connected to sequential block
	
	top_seq_1101_no dut(hex10s, hex, out, clk_led, in, clk_in, rst);
	
	initial clk_in = 0;
	always #1 clk_in = ~clk_in;
	
	initial begin
		rst=1; in=1; #2;
		rst=1; in=1; #2;
		rst=1; in=0; #2;
		rst=1; in=1; #2;
	end
	
	
endmodule