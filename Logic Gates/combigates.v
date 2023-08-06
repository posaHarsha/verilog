module gates (a,b,c,d,e,f,y);
input a,b,c,d,e,f;
output y;
wire t1,t2,t3;
assign t1 = ~(a&b);
assign t2 = c&~b&d;
assign t3 = ~(e|f);
assign y = ~(t1&t2&t3);
endmodule
