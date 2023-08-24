module pipeline(A,B,C,D,Result,clk);
input [5:0] A,B,C,D;
input clk;
output [12:0] Result;
reg [6:0] x1,x2,x3;
reg [5:0] d1,d2;
reg [12:0] f1;
assign Result = f1;

always @(posedge clk)
begin
	x1 = A+B;
	x2 = C-D;
	d1 = D;

	x3 = x1 + x2;
	d2 = d1;

	f1 = x3 * d2;
end
endmodule
