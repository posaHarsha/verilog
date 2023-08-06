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
