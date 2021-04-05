// trying to figure out having the image as an output
//module multCordicFunctTest4(SW,LEDR,KEY,CLOCK_50,HEX0,HEX1,HEX2,HEX3);
module multCordicFunctTest4(clk, reset, lineCount, lineResult);
	input clk, reset;
	input [5:0] lineCount;
	output reg [5:0] lineResult;
	
	/*module unnamed (
		input  wire [12:0] a,      //      a.a			Fraction: 10bits, width 13 bits, signed
		input  wire        areset, // areset.reset
		input  wire        clk,    //    clk.clk
		input  wire [11:0] x,      //      x.x			Fraction: 10bits, width 12 bits, signed
		output wire [9:0]  xo,     //     xo.xo		Fraction: 8bits, width 10 bits, signed
		input  wire [11:0] y,      //      y.y			Fraction: 10bits, width 12 bits, signed
		output wire [9:0]  yo      //     yo.yo		Fraction: 8bits, width 10 bits, signed
	);
	
*/

	parameter pipeOffset = 6'd19; // offset to translate origin to center of ant (47/2) will need to add in a 1'b.1 to vector
	
	
//	parameter x_i = 12'b001000000000; // d0.5 = 32
	wire [11:0] x_i = 12'b1_1_101010_0000; // -22?
	
	
	wire[12:0] theta_i = 13'b0_01_1001001000; // angle to rotate by (pi/2)
//	wire[12:0] theta_i = 13'b0_00_1100100100; // angle to rotate by (pi/4)

	// wire [row] varname [column]
	// wire [wordWidth] varname [row][column]
	
	// input: 12'b0_0_000000_0000
	
	
	// output: 10'b0_00_00000_00
	wire [9:0] x_o, y_o;
	
	reg [11:0] xInput [35:0];
	reg [11:0] yInput [35:0];
	
	reg [5:0] img_rotated [47:0] /*synthesis keep*/;
	
	reg pipeCleaner [pipeOffset:0]; // place to put the trash cordic output (is this necessary?)
	
	initial begin
	
		integer i;
		for (i=0; i < 36; i = i + 1) begin // init to 0
			xInput[i] = 12'b0_0_000000_0000;
			yInput[i] = 12'b0_0_000000_0000;
		end
				
		// initialize x values (6'd47 = 6'b101111)
		xInput[0] = 12'b0_0_000001_0000;
		xInput[1] = 12'b0_0_001011_0000;
		xInput[2] = 12'b0_0_000011_0000;
		xInput[3] = 12'b0_0_000001_0000;
		xInput[4] = 12'b0_0_100111_0000;
		xInput[5] = 12'b0_0_000001_0000;
		
		// initialize y values
		yInput[0] = 12'b0_0_000001_0000;
		yInput[1] = 12'b0_0_001000_0000;
		yInput[2] = 12'b0_0_000110_0000;
		yInput[3] = 12'b0_0_101000_0000;
		yInput[4] = 12'b0_0_100111_0000;
		yInput[5] = 12'b0_0_001111_0000;

		end
		
	initial begin
		integer i;
		for (i=0; i < 47; i = i + 1) begin // init to 0
			img_rotated[i] = 6'b000000; // this will make it so pixel 0,0 is always light up -> will deal with later
		end
		
	
	end
	
	reg [4:0] count = 0; // 19
	reg [4:0] pipeCleanCount = 0;
	
	// output from cordic:
	// x,x,x,x,x,0,1,2,3
	
	always @ (posedge clk)
	begin
		if (count > 5) begin // is this _really_ just greater than?
			count <= 0;
		end
		else count <= count + 1;
		
		
		if (reset == 1) begin
			count <= 0;
			pipeCleanCount <= 0;
		end
		
		if (pipeCleanCount >= pipeOffset) begin
			// set values
			// y_o[7:2] is the 'whole number' part of the output
			img_rotated[y_o[7:2]][x_o[7:2]] = 1;
			
		end else begin
			pipeCleanCount <= pipeCleanCount + 1;
		
		end
		
		lineResult <= img_rotated[lineCount];
		
	end
	
	unnamed c0(.a(theta_i), .areset(reset), .clk(clk), .x(xInput[count]), .xo(x_o), .y(yInput[count]), .yo(y_o)); 
	
				
endmodule 