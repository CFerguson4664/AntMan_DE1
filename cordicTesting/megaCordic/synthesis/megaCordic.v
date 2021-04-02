// megaCordic.v

// Generated using ACDS version 19.1 670

`timescale 1 ps / 1 ps
module megaCordic (
		input  wire [16:0] a,      //      a.a
		input  wire        areset, // areset.reset
		input  wire        clk,    //    clk.clk
		input  wire [15:0] x,      //      x.x
		output wire [9:0]  xo,     //     xo.xo
		input  wire [15:0] y,      //      y.y
		output wire [9:0]  yo      //     yo.yo
	);

	megaCordic_CORDIC_0 cordic_0 (
		.clk    (clk),    //    clk.clk
		.areset (areset), // areset.reset
		.x      (x),      //      x.x
		.y      (y),      //      y.y
		.a      (a),      //      a.a
		.xo     (xo),     //     xo.xo
		.yo     (yo)      //     yo.yo
	);

endmodule
