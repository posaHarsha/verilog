module divide(clk_in,reset,clk_out );

 input clk_in;
input  reset;
output clk_out;
 reg [1:0] pos_cnt;
 reg [1:0] neg_cnt;
  assign clk_out = ((pos_cnt != 2) && (neg_cnt != 2));
 
 
  always @ (posedge clk_in)
  if (reset) begin
    pos_cnt <= 0;
  end 
  else
  begin
    pos_cnt <= (pos_cnt == 2) ? 0 : pos_cnt + 1;
  end
  
  always @ (negedge clk_in)
  if (reset) 
  begin
    neg_cnt <= 0;
  end 
  else 
  begin
    neg_cnt <= (neg_cnt == 2) ? 0 : neg_cnt + 1;
  end
 endmodule
