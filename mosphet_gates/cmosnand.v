module nand1(x,y,z);
input x,y;
output z;
supply1 vcc;
supply0 ground;
wire a;

nmos n1(a,ground,x);
nmos n2(z,a,y);

pmos p1(z,vcc,x);
pmos p2(z,vcc,y);

endmodule

