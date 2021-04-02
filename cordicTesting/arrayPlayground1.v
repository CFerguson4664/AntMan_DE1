module arrayPlayground1(SW,LEDR,KEY,CLOCK_50,HEX0,HEX1,HEX2,HEX3);
	input[9:0] SW;
	input[3:0] KEY;
	input CLOCK_50;
	output[9:0] LEDR;
	output[6:0] HEX0,HEX1,HEX2,HEX3;
	
	wire [16:0] x_o, y_o;
	reg[16:0] display;
	reg[9:0] LEDR;
	
	// Goal: assemble 2d bitmap from 2 arrays: x points and y points
	
	// 	max val:7, and max amount:8
	reg [2:0] xArr [7:0];
	reg [2:0] yArr [7:0];
	
	//	x amount						y amount
	reg [7:0] img_assembled [7:0];
	
	initial begin
	
		integer i;
		for (i=0; i < 8; i = i + 1) begin // init to 0
			xArr[i] = 3'b0;
			yArr[i] = 3'b0;
			img_assembled[i] = 3'b0;
		end
		
		xArr[0] = 3'b001;
		xArr[1] = 3'b101;
		xArr[2] = 3'b010;
		xArr[3] = 3'b011;
		xArr[5] = 3'b001;
		
		yArr[0] = 3'b000;
		yArr[1] = 3'b000;
		yArr[2] = 3'b010;
		yArr[3] = 3'b011;
		yArr[5] = 3'b111;
		
	end
	
	reg [2:0] count = 0;
	always @ (posedge ~KEY[0])
		begin
			img_assembled[yArr[count]][xArr[count]] <= 1;
			count <= count + 1;
			display[3:0] = count;
		
		end
	
	
	always @ (*)
		begin
			LEDR = img_assembled[SW[2:0]];
			
		end
	
		bin7seghex h0(display[3:0], HEX0);
		bin7seghex h1(display[7:4], HEX1);
		bin7seghex h2(display[11:8], HEX2);
		bin7seghex h3(display[15:12], HEX3);
endmodule 