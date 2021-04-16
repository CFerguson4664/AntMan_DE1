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


reg CordicRST;
reg[9:0] CordicIDX = 0;
wire[56:0] CordicDATA;
wire CordicDONE;
reg [18:0] angle = 13'b0_00_0000000000_000000;

assign LEDR[8] = CordicDONE;

multCordicFunctTest7 m0(pixelCLK, CordicRST, CordicIDX, angle[18:6], CordicDATA, CordicDONE);//, HEX0,HEX1);





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
	
	if(CordicDONE == 1 && CordicIDX < 57) begin
		ant[CordicIDX - 2] <= CordicDATA;
		CordicIDX <= CordicIDX + 1; 
	end else begin 
		CordicIDX <= 0;
//		if (angle > 18'b1_11_1111111111_000000) begin
		if (angle == 18'b0_11_0010010000_000000) begin
//		if (angle > 18'b1_00_1101110000_000000) begin
			angle <= angle*-1;
		end else begin
			if (SW[0]) begin
				angle <= angle+1;
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



endmodule
