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

module cswp(a,b,c,a1,b1,c1);
input a,b,c;
output a1,b1,c1;
  wire ab, b11, b12, c11, c12;
    buf (a1, a);
    nott s1(a, ab);
    andd s2( ab, b,b11);
    andd s3( a, c,b12);
    orr s4( b11, b12,b1);
    andd s5( ab, c,c11);
    andd s6( a, b,c12);
    orr s7(c11, c12,c1);
    endmodule



