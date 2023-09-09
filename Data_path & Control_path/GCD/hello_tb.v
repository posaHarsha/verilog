module testbench;
reg a,b;
wire[1:0] c;

adder DUT(a,b,c);
initial
begin
	$monitor($time,"c=%b",c);
        $dumpfile("add.vcd");
	$dumpvars(0,testbench);
end
initial
begin
	#5 a=1; b=1;
	#5 a=0;
	#5 a=1; b=0;
	#5 a=0;
	#5 $finish;
end
endmodule
