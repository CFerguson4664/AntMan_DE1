module FrameBufferDisplay(
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

wire pixelCLK;
wire[10:0] HCount;
wire[8:0] VCount;
	
reg[7:0] red = 0,blue = 0,green = 0;

	PLL p0 (CLOCK_50,1'b0,pixelCLK);
	
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

MapGenerator mp(VPixel,mapData,imgX,imgY,inBounds,HEX0,HEX1);

assign newLine = (HCount == 1086) ? 1'b1 : 1'b0;

reg[10:0] imgY = 80;
reg[10:0] imgX = 80;

reg[10:0] imgOldY = 80;
reg[10:0] imgOldX = 80;

reg[56:0] ant[56:0];

reg[46:0] test = 47'b00000000000000000000111111000000000000000000000;

assign LEDR[9] = inBounds;

/*initial begin
	ant[0] =  47'b00_00000_00000_00000_00000_00000_00000_00000_00000_00000;
	ant[1] =  47'b00000000000000000000000000000000000000000000000;
	ant[2] =  47'b00000000000000000000000000000000000000000000000;
	ant[3] =  47'b00000000000000000000000000000000000000000000000;
	ant[4] =  47'b00000000000000000000000000000000000000000000000;
	ant[5] =  47'b00000000000000000000000000000000000000000000000;
	ant[6] =  47'b00000000001111111111111111111111000000000000000;
	ant[7] =  47'b00000000110000000000000000000001111100000000000;
	ant[8] =  47'b00000001100000000000000000000000000011000000000;
	ant[9] =  47'b00000001000000000000000000000000000000110000000;
	ant[10] = 47'b00000010000000000000000000000000000000011000000;
	ant[11] = 47'b00000010000000000000000000000000000000001000000;
	ant[12] = 47'b00000100000000000000000000000000000000001000000;
	ant[13] = 47'b00000100000000001111110000000000110000000100000;
	ant[14] = 47'b00001000000001111110001000000011101000000110000;
	ant[15] = 47'b00010000000001111111100100000111111100000011000;
	ant[16] = 47'b01110011110000000100011000011100000000000001000;
	ant[17] = 47'b01000100001100011000000000000100000000000001100;
	ant[18] = 47'b10001000100011100000001000000100000000000000100;
	ant[19] = 47'b10001000110000000000111000000110000000000000100;
	ant[20] = 47'b10001001101110000000100011000011000000100001000;
	ant[21] = 47'b10001000100011100000010000000011000001100011000;
	ant[22] = 47'b01000000110001011100000000000110000001100010000;
	ant[23] = 47'b00100000011101000011000000001000000111110010000;
	ant[24] = 47'b00010000011011100001111111111111111010110100000;
	ant[25] = 47'b00001000001001111101000001000100101010110100000;
	ant[26] = 47'b00001000000101001111000001000100101011110100000;
	ant[27] = 47'b00000100000011000001111111111111111111110100000;
	ant[28] = 47'b00000100000001000001001111111111111111100100000;
	ant[29] = 47'b00000010000000110010000010111111111010100100000;
	ant[30] = 47'b00000001000000011010000010000100101010100100000;
	ant[31] = 47'b00000000100000000111000010001000101011000010000;
	ant[32] = 47'b00000000011000000001111111111111111110000010000;
	ant[33] = 47'b00000000001100000000000000000000000000000010000;
	ant[34] = 47'b00000000000011000000000000000000000000000010000;
	ant[35] = 47'b00000000000000111000000000000000000000000010000;
	ant[36] = 47'b00000000000000000110000000000000000000000010000;
	ant[37] = 47'b00000000000000000001100000000000000000000010000;
	ant[38] = 47'b00000000000000000000011110000000000000000100000;
	ant[39] = 47'b00000000000000000000000011110000000000011000000;
	ant[40] = 47'b00000000000000000000000000001111111111100000000;
	ant[41] = 47'b00000000000000000000000000000000000000000000000;
	ant[42] = 47'b00000000000000000000000000000000000000000000000;
	ant[43] = 47'b00000000000000000000000000000000000000000000000;
	ant[44] = 47'b00000000000000000000000000000000000000000000000;
	ant[45] = 47'b00000000000000000000000000000000000000000000000;
	ant[46] = 47'b00000000000000000000000000000000000000000000000;
end*/

reg CordicRST;
reg[9:0] CordicIDX = 0;
wire[56:0] CordicDATA;
wire CordicDONE;
reg [18:0] angle = 13'b0_00_0000000000_000000;

assign LEDR[8] = CordicDONE;

multCordicFunctTest6 m0(pixelCLK, CordicRST, CordicIDX, angle[18:6], CordicDATA, CordicDONE);//, HEX0,HEX1);





always@(posedge pixelCLK)
begin
	

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
		
				if(~KEY[3])
				begin
					imgY <= imgY - 1;
				end else if(~KEY[2])
				begin
					imgY <= imgY + 1;
				end
			
			
				if(~KEY[1])
				begin
					imgX <= imgX - 1;
				end else if(~KEY[0])
				begin
					imgX <= imgX + 1;
				end
				
				imgOldX <= imgX;
				imgOldY <= imgY;
		
			end else begin
				imgX <= imgOldX;
				imgY <= imgOldY;
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
	
	if(CordicDONE == 1 && CordicIDX < 500) begin
		ant[CordicIDX - 2] <= CordicDATA;
		CordicIDX <= CordicIDX + 1; 
	end else begin 
		CordicIDX <= 0;
//		if (angle > 18'b1_11_1111111111_000000) begin
		if (angle == 18'b0_11_0010010000_000000) begin
//		if (angle > 18'b1_00_1101110000_000000) begin
			angle <= angle*-1;
		end else begin
			angle <= angle+1;
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



endmodule
