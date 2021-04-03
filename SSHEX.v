module SSHEX (A,Y);

input[3:0] A;
output[6:0] Y;
reg[6:0] Y;

always@(*)
begin
	case(A)
		0 : Y = 7'b1000000;
		1 : Y = 7'b1111001;
		2 : Y = 7'b0100100;
		3 : Y = 7'b0110000;
		4 : Y = 7'b0011001;
		5 : Y = 7'b0010010;
		6 : Y = 7'b0000010;
		7 : Y = 7'b1111000;
		8 : Y = 7'b0000000;
		9 : Y = 7'b0010000;
		10 : Y = 7'b0001000;
		11 : Y = 7'b0000011;
		12 : Y = 7'b1000110;
		13 : Y = 7'b0100001;
		14 : Y = 7'b0000110;
		15 : Y = 7'b0001110;
		default : Y = 7'b1111111;
	endcase
end

endmodule
