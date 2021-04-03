module test2(CLOCK_50, VGA_HS,VGA_VS,VGA_BLANK_N,VGA_SYNC_N,VGA_R,VGA_G,VGA_B,VGA_CLK,LEDR);
	input CLOCK_50;
	output VGA_HS,VGA_VS,VGA_BLANK_N,VGA_SYNC_N,VGA_CLK;
	output[7:0] VGA_R,VGA_G,VGA_B;
	output[9:0] LEDR;

	wire pixelCLK;
	
	reg[7:0] blue = 225,green = 0;
	wire CLRG,CLRB;
	
	wire[10:0] HCount, VCount;

	
// mod2FSM   (A,CLK,Y,R);
//	mod2FSM m0(1'b1, CLOCK_50, pixelCLK, 1'b0);
	
	PLL p0 (CLOCK_50,1'b0,pixelCLK);
	
// HCTRL		  (CLK,      SYNC, CNT)
	HCTRL CTRL0(pixelCLK, VGA_HS, HCount);
	
// VCTRL		  (CLK,      SYNC,   CNT,    HCNT)
	VCTRL CTRL1(pixelCLK, VGA_VS, VCount, HCount);
	
	assign VGA_BLANK_N = ((VCount > 37) & (VCount <= 517) & (HCount > 240) & (HCount <= 1088)) ? 1'b1 : 1'b0;
	
	assign VGA_R = 8'b00000000;
	assign VGA_G = green;
	assign VGA_B = blue;
	
	assign VGA_CLK = pixelCLK;
	assign VGA_SYNC_N = 1'b0;
	
	assign LEDR[9] = (VCount == 517) ? 1'b1 : 1'b0;
	
	assign CLRG = (green <= 255) ? 1'b0 : 1'b1;
	assign CLRB = (blue >= 0) ? 1'b0 : 1'b1;
	
	always@(negedge pixelCLK)
	begin
		if(CLRG) green <= 0;
		else green <= green + 1;
		
		if(CLRB) blue <= 255;
		else blue <= blue - 1;
	end
endmodule
