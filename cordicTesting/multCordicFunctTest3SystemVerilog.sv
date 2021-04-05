module multCordicFunctTest3SystemVerilog(SW,LEDR,KEY,CLOCK_50,HEX0,HEX1,HEX2,HEX3, img_rotated);
	input[9:0] SW;
	input[3:0] KEY;
	input CLOCK_50;
	output[9:0] LEDR;
	output[6:0] HEX0,HEX1,HEX2,HEX3;
	
	wire [16:0] x_o, y_o;
	reg [3:0] h0,h1,h2,h3;
	reg[9:0] LEDR;
	
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
	
	reg [11:0] xInput [35:0];
	reg [11:0] yInput [35:0];
	
	output [5:0] img_rotated [47:0];
	reg [5:0] img_rotated [47:0];
	
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
	
	always @ (posedge ~KEY[0])
	begin
		if (count > 5) begin // is this _really_ just greater than?
			count <= 0;
		end
		else count <= count + 1;
		
		
		if (SW[9] == 1) begin
			count <= 0;
			pipeCleanCount <= 0;
		end
		
		if (pipeCleanCount >= pipeOffset) begin
			// set values
			// y_o[7:2] is the 'whole number' part of the output
			img_rotated[y_o[7:2]][x_o[7:2]] = 1;
			h3 = 1;
			
		end else begin
			pipeCleanCount <= pipeCleanCount + 1;
			h3 = 0;
		
		end
		
		h0 = x_o[7:2];
		
	end
	
	unnamed c0(.a(theta_i), .areset(SW[9]), .clk(~KEY[0]), .x(xInput[count]), .xo(x_o), .y(yInput[count]), .yo(y_o)); 
	
	always @ (*)
	begin
		/*case ({SW[2], SW[1],SW[0]})
			3'b000: begin LEDR=x_i_s[SW[7:3]][11:2]; end
//			3'b001: begin LEDR <= x_o_m[9:0]; end
			3'b001: begin LEDR <= x_o_m[SW[7:3]]; end
//			3'b001: begin LEDR<=x_o_s[SW[7:3]][9:0]; end
//			3'b001: begin LEDR=x_o[9:0]; end
			3'b010: begin LEDR=y_i[11:2]; end
			3'b011: begin LEDR = y_o; end
			3'b100:begin LEDR = theta_i[12:3]; end
				
				
		endcase */
		
		case (SW[8])
			0: begin
//			LEDR[0] <= img_rotated[SW[7:4]][0];
//			LEDR[1] <= img_rotated[SW[7:4]][1];
//			LEDR[2] <= img_rotated[SW[7:4]][2];
//			LEDR[3] <= img_rotated[SW[7:4]][3];
//			LEDR[4] <= img_rotated[SW[7:4]][4];
//			LEDR[5] <= img_rotated[SW[7:4]][5];
			end
			1: LEDR <= img_rotated[SW[7:4]][SW[3:0]];
			
		endcase
		
		
		
	end
				
//		assign LEDR = img_rotated[SW[7:4]][0]; // does not work
	
	bin7seghex h0d(h0, HEX0);
		bin7seghex h1d(h1, HEX1);
		bin7seghex h2d(h2, HEX2);
		bin7seghex h3d(h3, HEX3);
//		assign LEDR[7] = display[16];
endmodule 