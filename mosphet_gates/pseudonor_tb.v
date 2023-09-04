module testbench;
reg in1,in2;
wire out;

pnor DUT(in1,in2,out);

initial 
begin
         $monitor($time,"in1 = %b,in2=%b,out=%b",in1,in2,out);
	 $dumpfile("nor.vcd");
	 $dumpvars(0,testbench);
end
initial
begin
	#5 in1 = 1; in2 = 1;
	#5 in1 = 0;
	#5 in2 = 0;
	#5 in1 = 1; in2 = 0;
	#5 $finish;
end	
endmodule
