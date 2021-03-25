module atan_n(index,val);
	input [5:0] index;
	output [22:0] val;
	
	reg [22:0] values [23:0];
	
	assign values[0] = 23'd4194314;
	assign values[1] = 23'd2476048;
	assign values[2] = 23'd1308276;
	assign values[3] = 23'd664101;
	assign values[4] = 23'd333339;
	assign values[5] = 23'd166832;
	assign values[6] = 23'd83436;
	assign values[7] = 23'd41720;
	assign values[8] = 23'd20860;
	assign values[9] = 23'd10430;
	assign values[10] = 23'd5215;
	assign values[11] = 23'd2607;
	assign values[12] = 23'd1303;
	assign values[13] = 23'd651;
	assign values[14] = 23'd325;
	assign values[15] = 23'd162;
	assign values[16] = 23'd81;
	assign values[17] = 23'd40;
	assign values[18] = 23'd20;
	assign values[19] = 23'd10;
	assign values[20] = 23'd5;
	assign values[21] = 23'd2;
	assign values[22] = 23'd1;
	assign values[23] = 23'd0;
	
	always@(*)
	begin
		val = values[index];
	end
endmodule
