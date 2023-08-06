module toffoli(a,b,c,a1,b1,c1);
input a,b,c;
output reg a1,b1,c1;
always @ (*)
begin
	if(a==1 && b==1)
	begin
            a1 <= a;
	    b1 <= b;
	    c1 <= ~c;
	end
	else
	begin
		a1 <= a;
		b1 <= b;
		c1 <= c;
	end
end
endmodule
