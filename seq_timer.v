module seq_timer(out, timer, state, t, ovr, clk, rst);
	input t;
	input clk;
	input rst;
	input ovr;
	output reg out;
	output [3:0] timer;
	output reg[3:0] state; 
	
	
	// state assignment
	parameter[3:0] S0 = 4'b0000;
	parameter[3:0] S1 = 4'b0001;
	parameter[3:0] S2 = 4'b0010;
	parameter[3:0] S3 = 4'b0011;
	reg[3:0] nxtState;
	reg[3:0] currState;
	
	// input block
	always @(t, ovr, currState) begin
		case(currState)
			S0: nxtState = (t==2) ? S1 : S0;
			S1: nxtState = (t==3) ? S2 : S1;
			S2: nxtState = (t==2) ? S0 : S2;
			S3: nxtState = (ovr==1) ? S3 : S0;
			default: nxtState = 0;
		endcase
	end

	
	// sequential block
	// reset input is negative edge-triggered
	always @(posedge clk, negedge rst) begin
		if (!rst) currState <= 0;
		else nxtState <= currState;

		// check timer + state
		case 
		
	
	end
	
	
	// output block
	always @(currState) begin
		case(currState)
			S0: begin
				out = 0;
				state = S0;
			end
			
			S1: begin
				out = 0;
				state = S1;
			end
			
			S2: begin
				out = 0;
				state = S2;
			end
			
			S3: begin
				out = 0;
				state = S3;
			end
			
			S4: begin
				out = 1;
				state = S4;
			end
			
		endcase
	end
	
	
	assign timer = t;
	
	
endmodule