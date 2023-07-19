module testbench;
reg a,b,c;
wire a1,b1,c1;
toffoli1 DUT(a,b,c,a1,b1,c1);
initial 
begin
$dumpfile("toffoli1.vcd");
$dumpvars;
$monitor($time,"a=%b b=%b c=%b a1=%b b1=%b c1=%b",a,b,c,a1,b1,c1);
#5 a=0; b=0; c=0;
#5 a=1;
#5 b=1;
#5 c=1;
#5 a=0;
#5 b=0;
#5 a=1;
#5 a=0; c=0; b=1;
#5 $finish;
end
endmodule


















































