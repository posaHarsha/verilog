module al(x,h,clk,y);
input [9:0] x,h; 
output reg y;
input clk;
always @(posedge clk)
y= |(x&h);
endmodule
