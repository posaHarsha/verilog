module testbench;

reg [6:0] data_in;
reg clk,start,stop;
wire done;

Datapath DP(lda,ldb,ldp,clrp,clk,data_in);
Controlpath CP(start,stop,done,lda,ldb,ldp,clrp,clk); 
always #5 clk = ~clk;
initial
begin
	$dumpfile("Dot.vcd");
	$dumpvars(0,testbench);
	$monitor($time,"%d %b",DP.P,done); 
end
initial 
begin
   clk = 0; #6 start = 1; 
   #25 data_in = 7'd2; #15 data_in = 7'd2; 
   #20 data_in = 7'd4; #10 data_in = 7'd6;
   #20 data_in = 7'd1; #10 data_in = 7'd6;
   #20 data_in = 7'd1; #10 data_in = 7'd3;
   #20 data_in = 7'd4; #10 data_in = 7'd4;
   #20 data_in = 7'd2; #10 data_in = 7'd5;
   #20 data_in = 7'd1; #10 data_in = 7'd4;
   #20 data_in = 7'd2; #10 data_in = 7'd3;
   #20 data_in = 7'd8; #10 data_in = 7'd4;
   #20 data_in = 7'd1; #10 data_in = 7'd2;
   #15 stop =1; #40 $finish;
   end
endmodule
