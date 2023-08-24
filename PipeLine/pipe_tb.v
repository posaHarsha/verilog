module testbench;
reg [5:0] A,B,C,D;
reg clk;
wire [12:0] Result;
pipeline DUT(A,B,C,D,Result,clk);

always #5 clk = ~clk;
initial
begin
     $monitor($time,"Result = %d",Result);
     $dumpfile("pipe.vcd");
     $dumpvars(0,testbench);
end
initial 
begin
    clk = 0;
    #1 A = 6'd21; B = 6'd19; C = 6'd20; D = 6'd4;
    #10 A = 6'd1; B = 6'd9; C = 6'd2; D = 6'd2;
    #10 A = 6'd2; B = 6'd4; C = 6'd5; D = 6'd2;
    #10 A = 6'd8; B = 6'd9; C = 6'd10; D = 6'd1;
    #10 A = 6'd7; B = 6'd3; C = 6'd14; D = 6'd4;
    #10 A = 6'd6; B = 6'd2; C = 6'd22; D = 6'd2;
    #10 A = 6'd5; B = 6'd1; C = 6'd2; D = 6'd0; 
    #10 $finish;
end
endmodule
