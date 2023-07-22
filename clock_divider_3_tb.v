module testbench;
reg reset, clk_in;
wire clk_out;
divide DUT(clk_in,reset,clk_out);
  
  initial
begin
$dumpfile("clock.vcd");
$dumpvars(0,testbench);
end
initial
begin
     clk_in = 0;
     reset = 0;
      #2  reset = 1;
      #2  reset = 0;
      #100  $finish;
  end  
always  #1  clk_in = ~clk_in;
endmodule
