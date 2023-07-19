module testbench;
reg [9:0] x,h;
wire  y;
reg clk=0;
wire [9:0] t;
al DUT(x,h,clk,y,t);
always 
	#5 clk=~clk;
initial 
begin
	$dumpfile("alu.vcd");
	$dumpvars(0,testbench);
	$monitor($time,"x=%b,h=%b,y=%b,clk=%b,t=%b",x,h,y,clk,t);
       
	x=10'b0000101011; h=10'b0001010101;
	#19  x=10'b0000000010; h=10'b0011111101; 
	#21 $finish;
end
endmodule
