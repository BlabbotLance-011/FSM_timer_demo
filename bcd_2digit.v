module bcd_2digit(leds10s,leds, bcd);
	input[2:0] bcd;
	output reg[0:6] leds;
	output reg[0:6] leds10s;
	
	always @(bcd) begin
		case(bcd)
			4'd0: leds = 7'b0000001;
			4'd1: leds = 7'b1001111;
			4'd2: leds = 7'b0010010;
			4'd3: leds = 7'b0000110;
			4'd4: leds = 7'b1001100;
			default: leds = 7'b1111110;
		endcase
			
			leds10s = 7'b0000001;
		
	end
endmodule