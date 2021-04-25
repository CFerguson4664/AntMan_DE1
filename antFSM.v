// Christopher Ferguson, Elliot Wannemacher
// ANT FSM
// Spring 2021

module antFSM(LAntenna,RAntenna,FW,TLeft,TRight,CLK,reset);
input CLK,LAntenna,RAntenna,reset;

parameter SA = 0;
parameter SB = 1;
parameter SE = 2;
parameter SLost = 3;

output reg FW,TLeft,TRight;


reg [1:0] pState = SLost, nState;

//Shift logic
always@(posedge CLK or negedge reset)
begin
	if(reset == 1'b0) begin
		pState <= SLost;
	end else begin
		pState <= nState;
	end
end

//Next state logic
always@(*)
case(pState)
SLost :	begin
				case({LAntenna,RAntenna})
				2'b00 : nState = SLost;
				2'b01 : nState = SA;
				2'b10 : nState = SE;
				2'b11 : nState = SE;
				endcase
				
				FW = 1'b1;
				TLeft = 1'b0;
				TRight = 1'b0;
			end
SA :	begin
			case({LAntenna,RAntenna})
			2'b00 : nState = SB;
			2'b01 : nState = SA;
			2'b10 : nState = SE;
			2'b11 : nState = SE;
			endcase
			
			FW = 1'b1;
			TLeft = 1'b1;
			TRight = 1'b0;
		end
SB :	begin
			case({LAntenna,RAntenna})
			2'b00 : nState = SB;
			2'b01 : nState = SA;
			2'b10 : nState = SE;
			2'b11 : nState = SE;
			endcase
			
			FW = 1'b1;
			TLeft = 1'b0;
			TRight = 1'b1;
		end
SE : 	begin
			case({LAntenna,RAntenna})
			2'b00 : nState = SB;
			2'b01 : nState = SA;
			2'b10 : nState = SE;
			2'b11 : nState = SE;
			endcase
			
			FW = 1'b0;
			TLeft = 1'b1;
			TRight = 1'b0;
		end
default : nState = SLost;
endcase


endmodule
