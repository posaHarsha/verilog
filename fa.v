module FA1(s, cout, a, b, c);
    output s, cout;
    input a, b, c;

    //wire x[7:0];
    wire axb, anb, cnaxb;
    xor(axb, a, b);
    xor(s, c, axb);
    and(anb, a, b);
    and(cnaxb, c, axb);
    or(cout, cnaxb, anb);
endmodule
