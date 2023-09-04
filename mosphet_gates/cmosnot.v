module cmosnot(in,out);
input in;
output out;
supply1 vcc;
supply0 ground;

nmos n1(out,ground,in);
pmos p1(out,vcc,in);

endmodule
