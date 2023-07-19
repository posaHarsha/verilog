module testbench;
reg [9:0] x,h;
wire  y;
reg clk=0;
al DUT(x,h,clk,y);
always 
	#5 clk=~clk;
initial 
begin
	$dumpfile("aluo.vcd");
	$dumpvars(0,testbench);
	$monitor($time,"x=%b,h=%b,y=%b,clk=%b",x,h,y,clk);
       
	#3 x=10'b0000101011; h=10'b0001010101;
        #7 x=10'b0000000010; h=10'b0011111101;
	#5 $finish;
end
endmodule
