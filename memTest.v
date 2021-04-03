module memTest(
	CLOCK_50, 						// Input 50 MHz Clock
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

wire pixelCLK;

wire[10:0] temp;	
mod10FSM fsm0(1'b1,CLOCK_50,temp[0],1'b0);
mod10FSM fsm1(1'b1,temp[0],temp[1],1'b0);	
mod10FSM fsm2(1'b1,temp[1],temp[2],1'b0);	
mod10FSM fsm3(1'b1,temp[2],temp[3],1'b0);
mod10FSM fsm4(1'b1,temp[3],temp[4],1'b0);
mod10FSM fsm5(1'b1,temp[4],pixelCLK,1'b0);



reg[15:0] currentLine; // data at currentLine
reg[15:0] nextLine; // data at nextLine


reg[2:0] count;
wire[15:0] outWire; // data from memoryController (read)
reg[15:0] inWire; // data input for memoryController (write)
wire Done;
reg Reset,Write;
reg used;

reg[3:0] VCount;

assign LEDR[7] = used;
assign LEDR[9] = Done;


//SSHEX(currentLine[15:12],HEX3);
//SSHEX(currentLine[11:8],HEX2);
SSHEX(currentLine[7:4],HEX1);
SSHEX(currentLine[3:0],HEX0);

SSHEX(VCount,HEX4);



always@(posedge (pixelCLK & ~KEY[0]))
begin

	


	if(count == 5) // done with r/w cycle
	begin
		count <= 0;
		currentLine <= nextLine;
		
		if(VCount == 15)
		begin
			VCount <= 0;
		end else begin
			VCount <= VCount + 1;
		end
	end
	
	case(count)
	0	:	begin // setup read op
				Reset = 1'b1;
				Write = 1'b0;
				count <= count + 1;
			end
	2	:	begin // after reading
				Reset = 1'b0;
				nextLine <= outWire;
				count <= count + 1;
				//displayBank <= !displayBank;
			end
	3	:	begin // setup write op
				inWire <= nextLine + VCount + 1; // write the current value + VCount
				Reset = 1'b1;
				Write = 1'b1;
				count <= count + 1;
			end
	default	:	begin 
						Reset = 1'b0;
					end
	endcase
	
	//Check the Done signal
	if(Done == 1 && used == 0) // if current operation is done
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

memoryControllerTest m0(
	(pixelCLK & ~KEY[0]),						// Input Clock
	VCount,							// The Row Address to operate on
	2'b00,					// Which Frame Buffer to operate on
	outWire, 								// Access to the Memory IO Buffer
	inWire, 								// Access to the Memory IO Buffer
	Write,							// High if the memory should be writing
	Done,								// Active High when the requested operation is complete
	Reset,							// Stops the current process, locks in the new values and starts the read or write process
	LEDR[8],
	
	HEX5,
	HEX2,
	HEX3,
	
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
	DRAM_CKE							//	SDRAM Clock Enable
);


endmodule
