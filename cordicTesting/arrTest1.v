/*module arrTest1(SW, HEX0,HEX1,HEX2,HEX3);
	input[9:0] SW;
	output[6:0] HEX0, HEX1, HEX2, HEX3;

	parameter ROW = 32; // -
	parameter COL = 32; // |
	
	// reg [packed] varname [unpacked]
	reg [ROW:0] grid [COL:0]; = // = {32'd0,32'd1,32'd2,32'd3,32'd4,32'd5,32'd6,32'd7,32'd8,32'd9,32'd10,32'd11,32'd12,32'd13,32'd14,32'd15,32'd16,32'd17,32'd18,32'd19,32'd20,32'd21,32'd22,32'd23,32'd24,32'd25,32'd26,32'd27,32'd28,32'd29,32'd30,32'd31};
	
	always @ (*)
		begin
			grid[0] = 0;
			grid[1] = 1;
			grid[2] = 2;
			grid[3] = 3;
			grid[4] = 4;
			grid[5] = 5;
			grid[6] = 6;
			grid[7] = 7;
			grid[8] = 8;
		end
	
//	
//	genvar i;
//	generate
//		for (i=0; i < ROW; i=i+1) begin
//			grid[i] = 1;
//		end
//	endgenerate
	
//	always @ (*)
//		casex(SW)
//			0:display=grid
//		endcase

	bin7seghex h0(grid[SW[5:0]][3:0], HEX0);
	bin7seghex h1(grid[SW[5:0]][7:4], HEX1);
	bin7seghex h2(grid[SW[5:0]][11:8], HEX2);
	bin7seghex h3(grid[SW[5:0]][15:12], HEX3);
	
endmodule
*/