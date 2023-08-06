module testbench;
reg x=0;
wire y;
nott DUT(x,y);
always #5 x=~x;
initial 
begin
$dumpfile("not.vcd");
$dumpvars;
$monitor($time,"x=%b y=%b",x,y);
#80 $finish;
end
endmodule






