module testbench;
reg x,y;
wire z;
andd DUT(x,y,z);
initial 
begin
$dumpfile("and.vcd");
$dumpvars;
$monitor($time,"x=%b y=%b z=%b",x,y,z);
#5 x=0; y=0;
#5 x=1;
#5 y=1;
#5 x=0;
#5 $finish;
end
endmodule

