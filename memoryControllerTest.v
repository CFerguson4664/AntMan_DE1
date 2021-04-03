module memoryControllerTest(
	CLK,								// Input Clock
	RowAddress,						// The Row Address to operate on
	BankAddress,					// Which Frame Buffer to operate on
	Out, 								// Access to the Memory IO Buffer
	In, 								// Access to the Memory IO Buffer
	Write,							// High if the memory should be writing
	Done,								// Active High when the requested operation is complete
	Reset,							// Stops the current process, locks in the new values and starts the read or write process
	LED,
	
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
	DRAM_CKE						//	SDRAM Clock Enable
);

input						CLK;					// Input Clock
input	 [3:0]		RowAddress;			// RowAddress input	
input	 [1:0]		BankAddress;			// BankAdress input
output [15:0] 		Out;					// Buffer to store the output from the memory
input  [15:0] 		In;					// Buffer to store the input from the memory
input						Write;				// Controls wheter the memory reads or writes
output reg				Done;					// Active High when the requested operation is complete
input 					Reset;				// Active High Reset

inout	 reg[15:0]	DRAM_DQ;					//	SDRAM Data bus 16 Bits
output reg[12:0]	DRAM_ADDR;				//	---SDRAM Address bus 12 Bits
output				DRAM_LDQM;				//	SDRAM Low-byte Data Mask 
output				DRAM_UDQM;				//	SDRAM High-byte Data Mask
output reg			DRAM_WE_N;				//	---SDRAM Write Enable
output reg			DRAM_CAS_N;				//	---SDRAM Column Address Strobe
output reg			DRAM_RAS_N;				//	---SDRAM Row Address Strobe
output				DRAM_CS_N;				//	***---SDRAM Chip Select							
output reg			DRAM_BA_0;				//	---SDRAM Bank Address 0
output reg			DRAM_BA_1;				//	---SDRAM Bank Address 0
output				DRAM_CLK;				//	---SDRAM Clock
output				DRAM_CKE;				//	SDRAM Clock Enable

output[6:0] HEX5,HEX2,HEX3;

output LED;

reg[6:0] count;
reg[6:0] readAddress;

reg[15:0] ioBuffer;
reg writeBuffer;
reg[3:0] rowAddressBuffer;
reg[6:0] columnAddress;
reg[1:0] bankAddressBuffer;

wire[12:0] Raddr;
wire[12:0] Caddr;

reg[15:0] viewer;

reg[15:0] data;

assign Raddr = {9'b000000000,rowAddressBuffer};
assign Caddr = {6'bxx0000,columnAddress};



// Setup DRAM Module
assign DRAM_CS_N = 1'b0;
assign DRAM_CKE = 1'b1;
assign DRAM_CLK = CLK;
assign DRAM_LDQM = 1'b0;
assign DRAM_UDQM = 1'b0;
assign Out = ioBuffer;

SSHEX(rowAddressBuffer,HEX5);

SSHEX(viewer[7:4],HEX3);
SSHEX(viewer[3:0],HEX2);

assign LED = writeBuffer;

always@(negedge CLK)
begin
	if(Reset == 1) 
	begin 
		count <= 0;
		columnAddress <= 0;
		readAddress <= 0;
		ioBuffer <= In;
		rowAddressBuffer <= RowAddress;
		bankAddressBuffer <= BankAddress;
		writeBuffer <= Write;
	end
	
	if(count == 0)
	begin
		DRAM_RAS_N = 1'b0;
		DRAM_CAS_N = 1'b1;
		DRAM_WE_N = 1'b1;

		DRAM_BA_0 <= bankAddressBuffer[0];
		DRAM_BA_1 <= bankAddressBuffer[1];
		DRAM_DQ <= 16'bzzzzzzzzzzzzzzzz;
		
		DRAM_ADDR <= Raddr;
	end else if(count >= 5 && count <= 5)
	begin
		if(writeBuffer == 1'b0)
		begin
			DRAM_RAS_N = 1'b1;
			DRAM_CAS_N = 1'b0;
			DRAM_WE_N = 1'b1;
			
			DRAM_BA_0 <= bankAddressBuffer[0];
			DRAM_BA_1 <= bankAddressBuffer[1];
			DRAM_DQ <= 16'bzzzzzzzzzzzzzzzz;
			
			DRAM_ADDR <= Caddr;
			
			columnAddress <= columnAddress + 1;
		end else begin
			DRAM_RAS_N = 1'b1;
			DRAM_CAS_N = 1'b0;
			DRAM_WE_N = 1'b0;
			
			DRAM_BA_0 <= bankAddressBuffer[0];
			DRAM_BA_1 <= bankAddressBuffer[1];
			
			DRAM_DQ <= ioBuffer/*[((columnAddress * 16) + 15)+:16]*/;
			viewer <= ioBuffer;
			//viewer = ioBuffer[((columnAddress * 16) + 15)+:16];
			
			DRAM_ADDR <= Caddr;
			
			columnAddress <= columnAddress + 1;
		end
	end else if(count == 7)
	begin
		DRAM_RAS_N = 1'b0;
		DRAM_CAS_N = 1'b1;
		DRAM_WE_N = 1'b0;
		
		DRAM_BA_0 <= bankAddressBuffer[0];
		DRAM_BA_1 <= bankAddressBuffer[1];
		
		DRAM_ADDR <= Caddr; 
	end
	
	if(count >= 7 && count <= 7 && !writeBuffer)
	begin
		ioBuffer/*[((readAddress * 16) + 15)+:16]*/ <= DRAM_DQ;
		viewer <= DRAM_DQ;
		readAddress <= readAddress + 1;
		//LED = 1'b1;
	end else begin
		//LED = 1'b0;
	end
	
	if(count < 14)
	begin
		count <= count + 1;
		Done <= 0;
	end else begin
		Done <= 1;
		DRAM_DQ <= 16'bzzzzzzzzzzzzzzzz;
	end
end	
endmodule
