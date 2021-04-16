// Elliot Wannemacher
// Lab 1.8
// 1/29/21

module bin7seghex(I,OUT);
	input[3:0] I;
	output[6:0] OUT;
	reg[6:0] OUT;
	
	// Active low!
	
	always @ (*)
		case(I)
			0: OUT = 7'b1000000;
			1: OUT = 7'b1111001;
			2: OUT = 7'b0100100;
			3: OUT = 7'b0110000;
			4: OUT = 7'b0011001;
			5: OUT = 7'b0010010;
			6: OUT = 7'b0000010;
			7: OUT = 7'b1111000;
			8: OUT = 7'b0000000;
			9: OUT = 7'b0010000;
			10: OUT = 7'b0001000; // A
			11: OUT = 7'b0000011; // b
			12: OUT = 7'b1000110; // C
			13: OUT = 7'b0100001; // d
			14: OUT = 7'b0000110; // E
			15: OUT = 7'b0001110; // F
			default: OUT = 7'b0000000;
			
		endcase
			
	
endmodule