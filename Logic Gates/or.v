module toffoli1(a,b,c,a1,b1,c1);
input a,b,c;
output a1,b1,c1;
wire t1;
buf (a1,a);
buf (b1,b);
and (t1,a,b);
xor (c1,t1,c);
endmodule

module orr(x,y,z);
input x,y;
output z;
wire t1,t2;
toffoli1 p1(x,x,c,a1,b1,t1);
assign c=1;
toffoli1 p2(y,y,c,a1,b1,t2);
assign c=1;
toffoli1 p3(t1,t2,c,a1,b1,z);
assign c=1;
endmodule


