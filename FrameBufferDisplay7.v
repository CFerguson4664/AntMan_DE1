module FrameBufferDisplay7(
	CLOCK_50, 						// Input 50 MHz Clock
	VGA_HS,							// VGA Horizontal Sync Signal
	VGA_VS,							//	VGA Vertical Sync Signal
	VGA_BLANK_N,					// VGA Blanking Signal
	VGA_SYNC_N,						// VGA Sync Signal
	VGA_R,							// VGA Red Value
	VGA_G,							// VGA Green Value
	VGA_B,							// VGA Blue Value
	VGA_CLK,							// VGA Output Clock
	
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	LEDR,
	KEY,
	SW,
);			//	SDRAM Clock Enable

output[6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
output[9:0] LEDR;
input[3:0] KEY;
input[9:0] SW;

input CLOCK_50;
output VGA_HS,VGA_VS,VGA_BLANK_N,VGA_SYNC_N,VGA_CLK;
output[7:0] VGA_R,VGA_G,VGA_B;

wire pixelCLK,logicCLK,win;
wire[10:0] HCount;
wire[8:0] VCount;
	
reg[7:0] red = 0,blue = 0,green = 0;

	PLL p0 (CLOCK_50,1'b0,pixelCLK);
	
assign logicCLK = pixelCLK;
	
// HCTRL		  (CLK,      SYNC, CNT)
	HCTRL CTRL0(pixelCLK, VGA_HS, HCount);
	
// VCTRL		  (CLK,      SYNC,   CNT,    HCNT)
	VCTRL CTRL1(pixelCLK, VGA_VS, VCount, HCount);

assign VGA_BLANK_N = ((VCount > 37) & (VCount <= 517) & (HCount > 240) & (HCount <= 1088)) ? 1'b1 : 1'b0;
	
assign VGA_R = red;
assign VGA_G = green;
assign VGA_B = blue;

assign VGA_CLK = pixelCLK;
assign VGA_SYNC_N = 1'b0;


reg[1695:0] currentLine;
reg[1695:0] nextLine;

reg[10:0] HPixel;
reg[8:0] VPixel;
reg[2:0] count;
wire newLine;

wire[1695:0] mapData;
reg [1695:0] mapData2[1:0];
wire inBounds;
wire ant1IB,ant2IB;

wire[17:0] startX,startY;

MapGenerator mp(VPixel,mapData,imgX,imgY,inBounds,HEX0,HEX1,ant1X2,ant1Y2,ant2X2,ant2Y2, ant1IB,ant2IB,SW[1:0],KEY[0],startX,startY,win);

wire FW,TLeft,TRight;
antFSM antFSMMain(ant1IB,ant2IB,FW,TLeft,TRight,logicCLK,KEY[0]);

assign LEDR[1] = ant1IB;
assign LEDR[0] = ant2IB;
assign LEDR[9] = win;

assign newLine = (HCount == 1086) ? 1'b1 : 1'b0;

wire[10:0] imgY;
wire[10:0] imgX;

reg[17:0] imgActY = 18'b10100000000000;
reg[17:0] imgActX = 18'b10100000000000;

reg[17:0] imgOldActY = 18'b10100000000000;
reg[17:0] imgOldActX = 18'b10100000000000;

reg[56:0] ant[56:0];

reg[46:0] test = 47'b00000000000000000000111111000000000000000000000;


assign imgX = imgActX[17:7];
assign imgY = imgActY[17:7];


reg CordicRST;
reg[9:0] CordicIDX = 0;
wire[56:0] CordicDATA;
wire CordicDONE;
//reg [18:0] angle = 18'b1_00_1101110000_000000; // -pi
reg [21:0] angle = 1;

assign LEDR[8] = CordicDONE;

wire[5:0] ant1X,ant1Y,ant2X,ant2Y;

wire signed[9:0]xcomp,ycomp;
wire[10:0] ant1X2,ant1Y2,ant2X2,ant2Y2;

multCordicFunctTest7 m0(logicCLK, CordicRST, CordicIDX, angle[21:9], CordicDATA, CordicDONE, ant1X,ant1Y,ant2X,ant2Y,xcomp,ycomp);//, HEX0,HEX1);

reg[5:0] value1,value2;

assign ant1X2 = ant1X + imgX - 28;
assign ant1Y2 = ant1Y + imgY - 28;

assign ant2X2 = ant2X + imgX - 28;
assign ant2Y2 = ant2Y + imgY - 28;

assign LEDR[5] = xcomp[9];
assign LEDR[4] = xcomp[8];

assign LEDR[3] = ycomp[9];
assign LEDR[2] = ycomp[8];




always@(posedge logicCLK or negedge KEY[0])
begin
	
	if(KEY[0] == 1'b0)
	begin
		imgActX <= startX;
		imgOldActX <= startX;
		
		imgActY <= startY;
		imgOldActY <= startY;
		
		angle <= 0;
	end else begin
	

		if(((HCount > 240) && (HCount <= 1088)))
		begin
			HPixel <= HPixel + 1;
		end 

		if(newLine == 1)
		begin
			HPixel <= 0;
			count <= 0;
			currentLine <= nextLine;
			
			if(VCount == 0)
			begin
				if(inBounds == 1'b0)
				begin
					
					if(FW == 1'b1) begin
					
						if(ycomp[9] == 1'b0) begin
							imgActY <= imgActY + ycomp[7:0];
						end else begin
							imgActY <= imgActY - (8'b11111111 - (ycomp[7:0] - 1));
						end
						
						if(xcomp[9] == 1'b0) begin
							imgActX <= imgActX + xcomp[7:0];
						end else begin
							imgActX <= imgActX - (8'b11111111 - (xcomp[7:0] - 1));
						end
						
					end /*else if(KEY[2] == 1'b0) begin
					
						if(ycomp[9] == 1'b1) begin
							imgActY <= imgActY + (8'b11111111 - (ycomp[7:0] - 1));
						end else begin
							imgActY <= imgActY - ycomp[7:0];
						end
						
						if(xcomp[9] == 1'b1) begin
							imgActX <= imgActX + (8'b11111111 - (xcomp[7:0] - 1));
						end else begin
							imgActX <= imgActX - xcomp[7:0];
						end
						
					end*/
					
					imgOldActX <= imgActX;
					imgOldActY <= imgActY;
			
				end else begin
					imgActX <= imgOldActX;
					imgActY <= imgOldActY;
				end
			
				VPixel <= 0;
			end else if(((VCount > 33) && (VCount <= 513)))
			begin
				VPixel <= VPixel + 1;
			end 
		end
		
		case(currentLine[(HPixel * 2)+:2])
		0	:	begin
					red = 0;
					green = 0;
					blue = 0;
				end
		1	:	begin
					red = 255;
					green = 0;
					blue = 0;
				end
		2	:	begin
					red = 0;
					green = 255;
					blue = 0;
				end
		3	:	begin
					red = 0;
					green = 0;
					blue = 255;
				end
		endcase
		
		case(count)
		0	:	begin
					nextLine <= mapData2[VCount[0]];
					count <= count + 1;
				end
		1	:	begin
					mapData2[VCount[0]] <= mapData;
					count <= count + 1;
				end
		endcase
		
		
		if(HCount == 0 && VCount == 0) begin
			CordicRST <= 1;
		end else begin
			CordicRST <= 0;
		end
		
		if(CordicDONE == 1 && CordicIDX < 59/*500*/) begin
			ant[CordicIDX - 2] <= CordicDATA;
			CordicIDX <= CordicIDX + 1; 
		end else begin 
			CordicIDX <= 0;
	//		if (angle > 18'b1_11_1111111111_000000) begin
	//		if (angle == 18'b1_10_0100100000_000000) begin //2pi
			if (angle == 22'b0_11_0010010000_000000000) begin //pi
	//		if (angle > 18'b1_00_1101110000_000000) begin
	//			angle <= 18'b1_00_1101110000_000000 + 1;
	//			angle <= 1;
				angle <= 22'b1_00_1101110000_000000000+1;// little bit more than -pi
			end else if(angle == 22'b1_00_1101110000_000000000) begin //-pi
	//			angle <= (18'b0_11_0010010000_000000 - 1);
	//			angle <= 18'b1_10_0100011111_111111;//2pi
				angle <= 22'b0_11_0010010000_000000000-1; // little bit less than pi
			end else begin
				if (TRight == 1'b1) begin
					angle <= angle+1;
				end else if(TLeft == 1'b1) begin
					angle <= angle-1; // change to sub 1
				end
			end
			
		end

		
		
		if(VPixel > (imgY - 29) && VPixel < (imgY + 29) && HPixel > (imgX - 25) && HPixel < (imgX + 33))
		begin
			if(ant[VPixel-(imgY - 29)][HPixel - (imgX - 25)+:1] == 1)
			begin
				mapData2[!VCount[0]][(HPixel * 2)] <= 1'b0;
				mapData2[!VCount[0]][(HPixel * 2) + 1] <= 1'b1;
			end
		end
	end
	
end



endmodule
