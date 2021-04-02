
module unnamed (
	clk,
	areset,
	a,
	x,
	y,
	xo,
	yo);	

	input		clk;
	input		areset;
	input	[12:0]	a;
	input	[11:0]	x;
	input	[11:0]	y;
	output	[9:0]	xo;
	output	[9:0]	yo;
endmodule
