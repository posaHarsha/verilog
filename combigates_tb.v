module testbench;
reg A,B,C,D,E,F; wire Y;
gates DUT(A,B,C,D,E,F,Y);
initial 
begin
	$dumpfile("gates.vcd");
	$dumpvars(0,testbench);
	$monitor($time,"a=%b,b=%b,c=%b,d=%b,e=%b,f=%b,y=%b",A,B,C,D,E,F,Y);
	#5 A=0; B=0; C=0; D=0; E=0; F=0;
	#5 A=1;
	#5 B=1;
	#5 C=1;
	#5 D=1;
	#5 E=1;
	#5 F=1;
	#5 $finish;
end
endmodule

