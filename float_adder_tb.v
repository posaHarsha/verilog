module testbench;
reg [31:0]a,b;
wire [31:0]z;
float_adder DUT(a,b,z);
initial 
begin
$dumpfile("add.vcd");
$dumpvars(0,testbench);
$monitor($time,"z= %h",z);
end
initial
begin
#10 a = 32'h40c80000 ; b = 32'h3e800000;
//#10 a = 32'h40c80000 ; b = 32'h3e800000;
#10 a = 32'h40c80000;  b=  32'hbe800000;
#10 a = 32'h40d00000; b = 32'hbe800000;
#20 $finish;
end
endmodule
