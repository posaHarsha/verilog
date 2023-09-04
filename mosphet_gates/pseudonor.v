module pnor (x,y,z);

input x,y;
output z;
supply0 ground;

nmos n1(z,ground,x);
nmos n2(z,ground,y);
pullup(z);

endmodule
