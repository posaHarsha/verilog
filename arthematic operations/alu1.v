module al(x,h,clk,y,t);
input [9:0] x,h; 
output reg y;
input clk;
reg count=0;
output reg [9:0] t;
always @(posedge clk)
begin
if(!count)
begin
t= (x&h);
end
if(count)
begin
y= |t;
end
count = ~count;
end
endmodule
