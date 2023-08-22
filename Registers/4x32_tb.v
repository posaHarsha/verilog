module testbench;
reg clk,write;
reg [1:0] ra1,ra2,wa;
reg [31:0] wdata;
wire [31:0] rdata1,rdata2;

registerbank DUT(ra1,ra2,wa,clk,write,rdata1,rdata2,wdata);

initial 
begin
	$dumpfile("reg.vcd");
	$dumpvars(0,testbench);
	$monitor($time,"data1 = %h,data2= %h",rdata1,rdata2);
end
always #5 clk = ~clk;
initial
begin
	clk = 0;
	#2 write = 1; wa = 2'b01;
	#1 wdata = 32'h00145601;
	#10 wa = 2'b10; #1 wdata = 32'h00000987;
	#10 ra1 = 2'b10; ra2 = 2'b01; wa = 2'b11 ;
	#10 $finish;
end
endmodule
