module testbench;

reg [3:0]x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9;
reg clk,reset;
wire [31:0]y;
a9 DUT(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,clk,reset,y);

always #1 clk = ~clk;

initial 
begin
$dumpfile("dot.vcd");
$dumpvars(0,testbench);
$monitor($time,"y = %d",y);
reset=1;
clk=0;
#1 x0=4'd1; x1=4'd2; x2=4'd2; x3=4'd3; x4=4'd4; x5=4'd1; x6=4'd3; x7=4'd2; x8=4'd1; x9=4'd2;
  h0=4'd10; h1=4'd1; h2=4'd4; h3=4'd2; h4=4'd3; h5=4'd1; h6=4'd0; h7=4'd1; h8=4'd2; h9=4'd1;
#10
reset = 0;
#9 x0=4'd1; x1=4'd10; x2=4'd2; x3=4'd3; x4=4'd4; x5=4'd8; x6=4'd3; x7=4'd2; x8=4'd9; x9=4'd12;
 h0=4'd10; h1=4'd1; h2=4'd4; h3=4'd2; h4=4'd3; h5=4'd1; h6=4'd0; h7=4'd1; h8=4'd2; h9=4'd1; 
 #9 $finish;
end

endmodule 
