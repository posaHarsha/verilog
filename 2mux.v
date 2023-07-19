module toffoli1(a,b,c,a1,b1,c1);
input a,b,c;
output a1,b1,c1;
wire t1;
buf (a1,a);
buf (b1,b);
and (t1,a,b);
xor (c1,t1,c);
endmodule


module nott(x,y);
input x;
output y;
toffoli1 Q1(a,b,x,a1,b1,y);
assign a=1;
assign b=1;
endmodule

module andd(x,y,z);
input x,y;
output z;
toffoli1 Q2(x,y,c,a1,b1,z);
assign c=0;
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

module muxx(s,d0,d1,y);
input s,d0,d1;
output y;
wire t1,t2,t3;
andd r1(d1,s,t2);
nott r2(s,t1);
andd r3(t1,d0,t3);
orr  r4(t2,t3,y);
endmodule
