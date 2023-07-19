module adder1 (a,b,ci,co,s);
input a,b,ci;
output co,s;
assign s = a^b^ci;
assign co = (a&b) | (b&ci) | (a&ci);
endmodule

module adder8 (a,b,ci,co,s);
input [7:0] a,b;
input ci;
output co;
output [7:0] s;
genvar i;
wire [8:0] c;
assign c[0] = ci;
for(i=0;i<8;i=i+1)
begin
	adder1 Fa(a[i],b[i],c[i],c[i+1],s[i]);
end 	
 assign co = c[8];
endmodule




