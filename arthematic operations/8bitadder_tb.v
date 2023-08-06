module testbench;
reg [7:0] a,b;
wire [7:0] s;
wire co;
reg ci;
adder8 DUT(a,b,ci,co,s);
initial
begin
	$dumpfile("add.vcd"); $dumpvars(0,testbench);
	$monitor($time,"a=%b,b=%b,ci=%b,co=%b,s=%b",a,b,ci,co,s);
	#5 a=8'b10101011; b=8'b01110101; ci=0;
	#5 a=8'b10011101; b=8'b01010010; ci=0;
	#5 $finish;
end
endmodule

