module testbench;
reg in;
wire out;

cmosnot DUT(in,out);

initial 
begin
         $monitor($time,"in = %b,out=%b",in,out);
	 $dumpfile("notc.vcd");
	 $dumpvars(0,testbench);	
end
initial
begin
	#5 in = 1; 
	#5 in = 0;
	#5 $finish;
end	
endmodule
