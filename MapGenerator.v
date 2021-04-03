module MapGenerator(row,data,x,y,inBounds,HEX0,HEX1);

	input[8:0] row;
	input[10:0] x,y;
	output reg[1695:0] data;
	output reg inBounds;
	output[6:0] HEX0,HEX1;
	
	reg[13:0] map1[7:0];
	
	integer i;
	initial begin
		map1[0] = 14'b11111111111111;
		map1[1] = 14'b10000000000001;
		map1[2] = 14'b10111011111101;
		map1[3] = 14'b10100010000001;
		map1[4] = 14'b10101111101111;
		map1[5] = 14'b10101010000011;
		map1[6] = 14'b10000010111001;
		map1[7] = 14'b11111111111101;
	end
	
	reg[2:0] rowD;
	
	reg[3:0] XD;
	reg[3:0] YD;
	
	SSHEX(XD,HEX1);
	SSHEX(YD,HEX0);
	
	
	always@(*)
	begin
		XD = x / 60;
		YD = y / 60;
		
		inBounds <= map1[YD][13 - XD];
	
	
		rowD = row / 60;
		data = {8'd0,	{120{map1[rowD][0]}},
							{120{map1[rowD][1]}},
							{120{map1[rowD][2]}},
							{120{map1[rowD][3]}},
							{120{map1[rowD][4]}},
							{120{map1[rowD][5]}},
							{120{map1[rowD][6]}},
							{120{map1[rowD][7]}},
							{120{map1[rowD][8]}},
							{120{map1[rowD][9]}},
							{120{map1[rowD][10]}},
							{120{map1[rowD][11]}},
							{120{map1[rowD][12]}},
							{120{map1[rowD][13]}},8'd0};
	end
endmodule
