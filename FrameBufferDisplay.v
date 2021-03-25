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
	
	DRAM_DQ,							//	SDRAM Data bus 16 Bits
	DRAM_ADDR,						//	SDRAM Address bus 12 Bits
	DRAM_LDQM,						//	SDRAM Low-byte Data Mask 
	DRAM_UDQM,						//	SDRAM High-byte Data Mask
	DRAM_WE_N,						//	SDRAM Write Enable
	DRAM_CAS_N,						//	SDRAM Column Address Strobe
	DRAM_RAS_N,						//	SDRAM Row Address Strobe
	DRAM_CS_N,						//	SDRAM Chip Select
	DRAM_BA_0,						//	SDRAM Bank Address 0
	DRAM_BA_1,						//	SDRAM Bank Address 0
	DRAM_CLK,						//	SDRAM Clock
	DRAM_CKE						//	SDRAM Clock Enable
);

//Port Declarations
inout[15:0]	 		DRAM_DQ;					//	SDRAM Data bus 16 Bits
output[12:0] 		DRAM_ADDR;				//	---SDRAM Address bus 12 Bits
output				DRAM_LDQM;				//	SDRAM Low-byte Data Mask 
output				DRAM_UDQM;				//	SDRAM High-byte Data Mask
output 				DRAM_WE_N;				//	---SDRAM Write Enable
output 				DRAM_CAS_N;				//	---SDRAM Column Address Strobe
output 				DRAM_RAS_N;				//	---SDRAM Row Address Strobe
output				DRAM_CS_N;				//	***---SDRAM Chip Select							
output 				DRAM_BA_0;				//	---SDRAM Bank Address 0
output 				DRAM_BA_1;				//	---SDRAM Bank Address 0
output				DRAM_CLK;				//	---SDRAM Clock
output				DRAM_CKE;				//	SDRAM Clock Enable

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
/*wire[10:0] temp;	
mod10FSM fsm0(1'b1,CLOCK_50,temp[0],1'b0);
mod10FSM fsm1(1'b1,temp[0],temp[1],1'b0);	
mod10FSM fsm2(1'b1,temp[1],temp[2],1'b0);	
mod10FSM fsm3(1'b1,temp[2],temp[3],1'b0);
mod10FSM fsm4(1'b1,temp[3],pixelCLK,1'b0);*/
	
	
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
reg[2:0] count;
wire newLine;
wire[1695:0] outWire;
reg[1695:0] inWire;
wire Done;
reg Reset,Write;
reg displayBank;
reg used;


assign newLine = (HCount == 1086) ? 1'b1 : 1'b0;

SSHEX(count,HEX5);
assign LEDR[7] = used;
assign LEDR[9] = Done;



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
		currentLine = nextLine;
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
				Reset = 1'b1;
				Write = 1'b0;
				count <= count + 1;
			end
	2	:	begin
				Reset = 1'b0;
				nextLine <= outWire;
				count <= count + 1;
				//displayBank <= !displayBank;
			end
	3	:	begin
				if(SW[0])
				begin
					inWire <= {nextLine[1694:0],!nextLine[1695]}; 
					Reset = 1'b1;
					Write = 1'b1;
					count <= count + 1;
				end
			end
	default	:	begin
						Reset = 1'b0;
					end
	endcase
	
	if(Done == 1 && used == 0)
	begin
		if(count > 0)
		begin
			count <= count + 1;
			used = 1;
		end
	end else if(Done == 0) begin
		used = 0;
	end
end

/*memoryController m0(
	CLK,								// Input Clock
	RowAddress,						// The Row Address to operate on
	BankAddress,					// Which Frame Buffer to operate on
	Out, 								// Access to the Memory IO Buffer
	In, 								// Access to the Memory IO Buffer
	Write,							// High if the memory should be writing
	Done,								// Active High when the requested operation is complete
	Reset,							// Stops the current process, locks in the new values and starts the read or write process
	
	DRAM_DQ,							//	SDRAM Data bus 16 Bits
	DRAM_ADDR,						//	SDRAM Address bus 12 Bits
	DRAM_LDQM,						//	SDRAM Low-byte Data Mask 
	DRAM_UDQM,						//	SDRAM High-byte Data Mask
	DRAM_WE_N,						//	SDRAM Write Enable
	DRAM_CAS_N,						//	SDRAM Column Address Strobe
	DRAM_RAS_N,						//	SDRAM Row Address Strobe
	DRAM_CS_N,						//	SDRAM Chip Select
	DRAM_BA_0,						//	SDRAM Bank Address 0
	DRAM_BA_1,						//	SDRAM Bank Address 0
	DRAM_CLK,						//	SDRAM Clock
	DRAM_CKE,						//	SDRAM Clock Enable
);*/

memoryController m0(
	pixelCLK,						// Input Clock
	VCount,							// The Row Address to operate on
	{1'b0,displayBank},					// Which Frame Buffer to operate on
	outWire, 								// Access to the Memory IO Buffer
	inWire, 								// Access to the Memory IO Buffer
	Write,							// High if the memory should be writing
	Done,								// Active High when the requested operation is complete
	Reset,							// Stops the current process, locks in the new values and starts the read or write process
	
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	LEDR[8],
	
	DRAM_DQ,							//	SDRAM Data bus 16 Bits
	DRAM_ADDR,						//	SDRAM Address bus 12 Bits
	DRAM_LDQM,						//	SDRAM Low-byte Data Mask 
	DRAM_UDQM,						//	SDRAM High-byte Data Mask
	DRAM_WE_N,						//	SDRAM Write Enable
	DRAM_CAS_N,						//	SDRAM Column Address Strobe
	DRAM_RAS_N,						//	SDRAM Row Address Strobe
	DRAM_CS_N,						//	SDRAM Chip Select
	DRAM_BA_0,						//	SDRAM Bank Address 0
	DRAM_BA_1,						//	SDRAM Bank Address 0
	DRAM_CLK,						//	SDRAM Clock
	DRAM_CKE						//	SDRAM Clock Enable
);

endmodule
