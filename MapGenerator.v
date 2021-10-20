// Christopher Ferguson, Elliot Wannemacher
// ECE361 Lab Project
// Spring 2021

module MapGenerator(row,data,x,y,inBounds,ant1X,ant1Y,ant2X,ant2Y, ant1IB,ant2IB,map,reset,startX,startY,win);

	input reset;
	input[1:0] map;
	input[8:0] row;
	input[10:0] x,y,ant1X,ant1Y,ant2X,ant2Y;
	
	output reg win = 1;
	output reg[1695:0] data;
	output reg inBounds,ant1IB,ant2IB;
	output reg[17:0] startX,startY;
	
	//Create the registers to store the map data
	reg[13:0] map1[7:0];
	reg[13:0] map2[7:0];
	reg[13:0] map3[7:0];
	reg[13:0] map4[7:0];
	
	
	//Store the starting locations for each of the maps
	reg[17:0] map1X = {11'd80,7'b0000000};
	reg[17:0] map1Y = {11'd80,7'b0000000};
	
	reg[17:0] map2X = {11'd80,7'b0000000};
	reg[17:0] map2Y = {11'd80,7'b0000000};
	
	reg[17:0] map3X = {11'd280,7'b0000000};
	reg[17:0] map3Y =	{11'd380,7'b0000000};
	
	reg[17:0] map4X = {11'd80,7'b0000000};
	reg[17:0] map4Y = {11'd80,7'b0000000};
	
	reg[1:0] mapA = 0;
	
	
	initial begin
		//Initialize the data for each of the maps
		//A '1' is a wall and a '0' is empty space
		map1[0] = 14'b11111111111111;
		map1[1] = 14'b10001000000001;
		map1[2] = 14'b10111011111101;
		map1[3] = 14'b10100010000001;
		map1[4] = 14'b10101111101111;
		map1[5] = 14'b10101010000011;
		map1[6] = 14'b10000010111001;
		map1[7] = 14'b11111111111101;
		
		map2[0] = 14'b11111111111111;
		map2[1] = 14'b10001000000001;
		map2[2] = 14'b10111011111101;
		map2[3] = 14'b10100010000001;
		map2[4] = 14'b10101111101111;
		map2[5] = 14'b10101000000011;
		map2[6] = 14'b10000000111001;
		map2[7] = 14'b11111111111101;
		
		map3[0] = 14'b11111111111111;
		map3[1] = 14'b10000000000001;
		map3[2] = 14'b10011110101011;
		map3[3] = 14'b10010000101001;
		map3[4] = 14'b10001000011101;
		map3[5] = 14'b10000110100101;
		map3[6] = 14'b10000100010001;
		map3[7] = 14'b11111101111111;
		
		map4[0] = 14'b11111111111111;
		map4[1] = 14'b10000000000001;
		map4[2] = 14'b10111011111101;
		map4[3] = 14'b10100010000001;
		map4[4] = 14'b10101111101111;
		map4[5] = 14'b10101010000011;
		map4[6] = 14'b10000010111001;
		map4[7] = 14'b11111111111101;
	end
	
	//Store the results of the upcoming divisions
	reg[31:0] rowD;
	reg[31:0] XD,ant1XD,ant2XD;
	reg[31:0] YD,ant1YD,ant2YD;
	
	always@(negedge reset)
	begin
		mapA <= map;
	end
	
	always@(*)
	begin
		//Figure out what square of the map each part of the ant is in
		XD = x / 60;
		YD = y / 60;
		ant1XD = ant1X / 60;
		ant1YD = ant1Y / 60;
		ant2XD = ant2X / 60;
		ant2YD = ant2Y / 60;
		
		//Detect if the ant has reached the end of the maze
		if(reset == 1'b0) begin
			win <= 1'b0;
		end else if(YD == 4'b1000) begin
			win <= 1'b1;
		end else begin
			win <= win;
		end
		
		//Send the correct data for the map we are doing
		case(mapA)
		
		2'b00 :	begin
						inBounds <= map1[YD][13 - XD];
						ant1IB <= map1[ant1YD][13 - ant1XD];
						ant2IB <= map1[ant2YD][13 - ant2XD];
					
					
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
		2'b01 :	begin
						inBounds <= map2[YD][13 - XD];
						ant1IB <= map2[ant1YD][13 - ant1XD];
						ant2IB <= map2[ant2YD][13 - ant2XD];
					
					
						rowD = row / 60;
						data = {8'd0,	{120{map2[rowD][0]}},
											{120{map2[rowD][1]}},
											{120{map2[rowD][2]}},
											{120{map2[rowD][3]}},
											{120{map2[rowD][4]}},
											{120{map2[rowD][5]}},
											{120{map2[rowD][6]}},
											{120{map2[rowD][7]}},
											{120{map2[rowD][8]}},
											{120{map2[rowD][9]}},
											{120{map2[rowD][10]}},
											{120{map2[rowD][11]}},
											{120{map2[rowD][12]}},
											{120{map2[rowD][13]}},8'd0};
					end
		2'b10 :	begin
						inBounds <= map3[YD][13 - XD];
						ant1IB <= map3[ant1YD][13 - ant1XD];
						ant2IB <= map3[ant2YD][13 - ant2XD];
					
					
						rowD = row / 60;
						data = {8'd0,	{120{map3[rowD][0]}},
											{120{map3[rowD][1]}},
											{120{map3[rowD][2]}},
											{120{map3[rowD][3]}},
											{120{map3[rowD][4]}},
											{120{map3[rowD][5]}},
											{120{map3[rowD][6]}},
											{120{map3[rowD][7]}},
											{120{map3[rowD][8]}},
											{120{map3[rowD][9]}},
											{120{map3[rowD][10]}},
											{120{map3[rowD][11]}},
											{120{map3[rowD][12]}},
											{120{map3[rowD][13]}},8'd0};
					end
		2'b11 :	begin
						inBounds <= map4[YD][13 - XD];
						ant1IB <= map4[ant1YD][13 - ant1XD];
						ant2IB <= map4[ant2YD][13 - ant2XD];
					
					
						rowD = row / 60;
						data = {8'd0,	{120{map4[rowD][0]}},
											{120{map4[rowD][1]}},
											{120{map4[rowD][2]}},
											{120{map4[rowD][3]}},
											{120{map4[rowD][4]}},
											{120{map4[rowD][5]}},
											{120{map4[rowD][6]}},
											{120{map4[rowD][7]}},
											{120{map4[rowD][8]}},
											{120{map4[rowD][9]}},
											{120{map4[rowD][10]}},
											{120{map4[rowD][11]}},
											{120{map4[rowD][12]}},
											{120{map4[rowD][13]}},8'd0};
					end
		endcase
		
		//Send the correct start locations for the map we are doing
		case(map)
		2'b00	:	begin
						startX <= map1X;
						startY <= map1Y;
					end
		2'b01	:	begin
						startX <= map2X;
						startY <= map2Y;
					end
		2'b10	:	begin
						startX <= map3X;
						startY <= map3Y;
					end
		2'b11	:	begin
						startX <= map4X;
						startY <= map4Y;
					end
		endcase
	end
endmodule
