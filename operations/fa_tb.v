`timescale 1 ns / 1 ps

module test;
  /* Make A, B, C three clocks so all combination are tested */
  reg A=0;
  always #4 A = !A;
  reg B=0;
  always #2 B = !B;
  reg C=0;
  always #1 C = !C;

  wire s, cout;
  FA1 fa(s, cout, A, B, C);

  initial
    begin
        $monitor("At time %t, %0d %0d %0d %0d %0d", $time, cout, s, A, B, C);
        #100 $finish;
    end
  initial
    begin
        $dumpfile("fa.vcd"); 
        $dumpvars;
    end 
endmodule // test



