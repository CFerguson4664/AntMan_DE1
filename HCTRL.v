module HCTRL(CLK,SYNC,CNT);
	input CLK;
	output SYNC;
	output reg[10:0] CNT;
	wire CLRV;
	
	//Once the counter hits 525, reset it
	assign CLRV = (CNT <= 1088) ? 1'b0 : 1'b1;
	
	//SYNC is active low. Set it low when we are in the vertical sync interval
	assign SYNC = ((CNT >= 16) & (CNT <= 128)) ? 1'b0 : 1'b1;
	
	always@(posedge CLK)
	begin
		if(CLRV) CNT <= 0;
		else CNT <= CNT + 1;
	end
endmodule
