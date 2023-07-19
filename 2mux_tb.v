module testbench;
reg s,d0,d1;
wire y;
muxx DUT(s,d0,d1,y);
initial 
begin
$dumpfile("mux.vcd");
$dumpvars;
$monitor($time,"s=%b d0=%b d1=%b y=%b",s,d0,d1,y);
#5 s=0; d0=0; d1=1;
#5 s=1;
#5 d1=0;
#5 s=0; d0=1;
#5 $finish;
end
endmodule

