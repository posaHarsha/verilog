module toffoli1(a,b,c,a1,b1,c1);
input a,b,c;
output a1,b1,c1;
wire t1;
buf (a1,a);
buf (b1,b);
and (t1,a,b);
xor (c1,t1,c);
endmodule

module andd(x,y,z);
input x,y;
output z;
toffoli1 Q2(x,y,c,a1,b1,z);
assign c=0;
endmodule
