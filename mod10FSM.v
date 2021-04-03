// Mod 10 Finite State Machine
// 3/4/21
// Christopher Ferguson

module mod10FSM(A,CLK,Y,R);
input A,CLK,R;
output Y;

parameter S0 = 0;
parameter S1 = 1;
parameter S2 = 2;
parameter S3 = 3;
parameter S4 = 4;
parameter S5 = 5;
parameter S6 = 6;
parameter S7 = 7;
parameter S8 = 8;
parameter S9 = 9;


reg [3:0] pState, nState;

//Shift logic
always@(posedge CLK or posedge R)
begin
	if(R==1) pState = S0;
	else pState = nState;
end

//Next state logic
always@(*)
case(pState)
S0 :	case(A)
		0 : nState = S9;
		1 : nState = S1;
		endcase
S1 :	case(A)
		0 : nState = S0;
		1 : nState = S2;
		endcase
S2 :	case(A)
		0 : nState = S1;
		1 : nState = S3;
		endcase
S3 : 	case(A)
		0 : nState = S2;
		1 : nState = S4;
		endcase
S4 : 	case(A)
		0 : nState = S3;
		1 : nState = S5;
		endcase
S5 : 	case(A)
		0 : nState = S4;
		1 : nState = S6;
		endcase
S6 : 	case(A)
		0 : nState = S5;
		1 : nState = S7;
		endcase
S7 : 	case(A)
		0 : nState = S6;
		1 : nState = S8;
		endcase
S8 : 	case(A)
		0 : nState = S7;
		1 : nState = S9;
		endcase
S9 : 	case(A)
		0 : nState = S8;
		1 : nState = S0;
		endcase
default : nState = S0;
endcase


assign Y = (pState == S0) ? 1 : 0;

endmodule
