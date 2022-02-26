// Christopher Ferguson, Elliot Wannemacher
// ECE361 Lab Project
// Spring 2021

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
	
	/*HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,*/
	LEDR,
	KEY,
	SW
);			

//Control inputs
input[3:0] KEY;
input[9:0] SW;

//Debug outputs
/*output[6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;*/
output[9:0] LEDR;

//Clock input
input CLOCK_50;

//VGA outputs
output VGA_HS,VGA_VS,VGA_BLANK_N,VGA_SYNC_N,VGA_CLK;
output[7:0] VGA_R,VGA_G,VGA_B;

//VGA internal Controls
wire[10:0] HCount;
wire[8:0] VCount;
reg[10:0] HPixel;
reg[8:0] VPixel;
reg[2:0] count;
wire newLine;

//Storage for the VGA display code
reg[1695:0] currentLine;
reg[1695:0] nextLine;
wire[1695:0] mapData;
reg [1695:0] mapData2[1:0];

//Output wires for ant collision detection
wire inBounds,ant1IB,ant2IB,win;

//Output wires for the start location of the ant.
wire[17:0] startX,startY;

//Wires for the clock signals.
wire pixelCLK,logicCLK;
wire PLLRST;
	

//Registers to store the color to display	
reg[7:0] red = 0,blue = 0,green = 0;

//Output wires from the and FSM
wire FW,TLeft,TRight;

//Wires and registers to store the position of the ant.
wire[10:0] imgY;
wire[10:0] imgX;

reg[17:0] imgActY = {11'd80,7'b0000000};
reg[17:0] imgActX = {11'd80,7'b0000000};

reg[17:0] imgOldActY = {11'd80,7'b0000000};
reg[17:0] imgOldActX = {11'd80,7'b0000000};

//Array to store the image of the ant
reg[56:0] ant[56:0];

//Registers and wire for the CORDIC rotation algorithm
reg CordicRST;
reg[9:0] CordicIDX = 0;
wire[56:0] CordicDATA;
wire CordicDONE;
reg [21:0] angle = 1;
wire signed[9:0]xcomp,ycomp;
wire[10:0] ant1X2,ant1Y2,ant2X2,ant2Y2;
wire[5:0] ant1X,ant1Y,ant2X,ant2Y;



	
//PLL generates the signal for the VGA pixel clock
	PLL p0 (CLOCK_50,PLLRST,pixelCLK);
	
assign logicCLK = pixelCLK;

// HCTRL and VCTRL drive the VGA output
// HCTRL		  (CLK,      SYNC, CNT)
	HCTRL CTRL0(pixelCLK, VGA_HS, HCount);
	
// VCTRL		  (CLK,      SYNC,   CNT,    HCNT)
	VCTRL CTRL1(pixelCLK, VGA_VS, VCount, HCount);
	
//Calculate when we are finished displaying the current line
assign newLine = (HCount == 1086) ? 1'b1 : 1'b0;

//Control the VGA blanking interval based on HCTRL and VCTRL	
assign VGA_BLANK_N = ((VCount > 37) & (VCount <= 517) & (HCount > 240) & (HCount <= 1088)) ? 1'b1 : 1'b0;

//Assign the colors to their outputs
assign VGA_R = red;
assign VGA_G = green;
assign VGA_B = blue;

//Assign the clock signals to their outputs
assign VGA_CLK = pixelCLK;
assign VGA_SYNC_N = 1'b0;

//
//MapGenerator provides all of the data reguarding the map
MapGenerator mp(VPixel,mapData,imgX,imgY,inBounds,ant1X2,ant1Y2,ant2X2,ant2Y2, ant1IB,ant2IB,SW[1:0],KEY[0],startX,startY,win);

//Connection to the controlling ant FSM
antFSM antFSMMain(ant1IB,ant2IB,FW,TLeft,TRight,logicCLK,KEY[0]);


assign LEDR[0] = ant1IB;
assign LEDR[1] = ant2IB;
assign LEDR[2] = FW;
assign LEDR[3] = TLeft;
assign LEDR[4] = TRight;

//Position the image using the whole number part of the position
assign imgX = imgActX[17:7];
assign imgY = imgActY[17:7];


//Connection to the CORDIC rotation algorithm
multCordicFunctTest7 m0(logicCLK, CordicRST, CordicIDX, angle[21:9], CordicDATA, CordicDONE, ant1X,ant1Y,ant2X,ant2Y,xcomp,ycomp);


//Calculate the global positions of the antennas
assign ant1X2 = ant1X + imgX - 11'd28;
assign ant1Y2 = ant1Y + imgY - 11'd28;

assign ant2X2 = ant2X + imgX - 11'd28;
assign ant2Y2 = ant2Y + imgY - 11'd28;



//Main control loop for the system
always@(posedge logicCLK or negedge KEY[0])
begin
	
	//If KEY[0] is presse, reset
	if(KEY[0] == 1'b0)
	begin
		imgActX <= startX;
		imgOldActX <= startX;
		
		imgActY <= startY;
		imgOldActY <= startY;
		
		angle <= 0;
	end else begin
	//Otherwise execute the control loop
		
		
		//Calculate the horizontl pixel which is currently being displayed.
		if(((HCount > 240) && (HCount <= 1088)))
		begin
			HPixel <= HPixel + 11'd1;
		end 
		
		
		//If we are beginning a new line
		if(newLine == 1)
		begin
			//Reset the control counters
			HPixel <= 0;
			count <= 0;
			currentLine <= nextLine;
			
			
			//If we are starting a new frame
			if(VCount == 0)
			begin
				//If the player is in bounds, adjust its position
				if(inBounds == 1'b0)
				begin
					
					if(FW == 1'b1) begin
					
						if(win == 1'b0)
						begin
							if(ycomp[9] == 1'b0) begin
								imgActY <= imgActY + ycomp[7:0];
							end else begin
								imgActY <= imgActY - (8'b11111111 - (ycomp[7:0] - 18'd1));
							end
							
							if(xcomp[9] == 1'b0) begin
								imgActX <= imgActX + xcomp[7:0];
							end else begin
								imgActX <= imgActX - (8'b11111111 - (xcomp[7:0] - 18'd1));
							end
						end
					end 
					
					imgOldActX <= imgActX;
					imgOldActY <= imgActY;
				
				//If the player is not in bounds, move it back to its previous position
				end else begin
					imgActX <= imgOldActX;
					imgActY <= imgOldActY;
				end
				
				//Counter to keep track of what vertical line is being displayed
				VPixel <= 0;
			end else if(((VCount > 33) && (VCount <= 513)))
			begin
				VPixel <= VPixel + 9'd1;
			end 
		end
		
		//Convert the data from MapGenerator into actual colors
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
		
		//Buffer the data coming out of MapGenerator so we can overlay the player's image onto it
		case(count)
		0	:	begin
					nextLine <= mapData2[VCount[0]];
					count <= count + 3'd1;
				end
		1	:	begin
					mapData2[VCount[0]] <= mapData;
					count <= count + 3'd1;
				end
		endcase
		
		
		//Controls for the CORDIC algorithm
		
		//If we are starting a new frame, start the cordic algorithm
		if(HCount == 0 && VCount == 0) begin
			CordicRST <= 1;
		end else begin
			CordicRST <= 0;
		end
		
		//Once the cordic algorithm finished,;
		if(CordicDONE == 1 && CordicIDX < 59) begin
			//Retrieve the rotated data for the ant image
			ant[CordicIDX - 2] <= CordicDATA;
			CordicIDX <= CordicIDX + 10'd1; 
		end else begin 
			//If the cordic algorithm is not done.
			CordicIDX <= 0;
			
			
			//Control the rotation of the image
			
			//If the angle of the image is pi
			if (angle == 22'b0_11_0010010000_000000000) begin //pi
				
				//Set it to be a little more than negative pi
				angle <= 22'b1_00_1101110000_000000000 + 22'd1;// little bit more than -pi
				
			//If the angle of the image is negative pi	
			end else if(angle == 22'b1_00_1101110000_000000000) begin //-pi
			
				//Set it to be a little less than pi
				angle <= 22'b0_11_0010010000_000000000 - 22'd1; // little bit less than pi
			end else begin
				if(win == 0)
					begin
					//If we need to turn right
					if (TRight == 1'b1) begin
						//Increase the angle of the image
						angle <= angle + 22'd1;
						
					//If we need to turn left
					end else if(TLeft == 1'b1) begin
						//Decrease the angle of the image
						angle <= angle - 22'd1;
					end
				end
			end
		end

		
		//This code is responsible for ovelaying the image of the ant onto the information from MapGenerator
		
		//If we are within the range where the ant image should be displayed 
		if(VPixel > (imgY - 29) && VPixel < (imgY + 29) && HPixel > (imgX - 25) && HPixel < (imgX + 33))
		begin
			//Check if the ant should be displayed in the current pixel next frame
			if(ant[VPixel-(imgY - 29)][HPixel - (imgX - 25)+:1] == 1)
			begin
				//If it should, set the pixel to be the color of the ant.
				mapData2[!VCount[0]][(HPixel * 2)] <= 1'b0;
				mapData2[!VCount[0]][(HPixel * 2) + 1] <= 1'b1;
			end
		end
	end
end



endmodule
