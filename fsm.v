module seq_detector(x,clk,reset,z);
input x,clk,reset;
output reg z;
parameter s0=0,s1=1,s2=2,s3=3,s4=4;
reg [0:2] ps,ns;
always @(posedge clk or posedge reset)
	if (reset) ps <= s0;
	else ps <= ns;
	
always @(ps,x)
	case(ps)
		s0:begin
			z = x ? 0:0;
			ns = x ? s1:s0;
		end
		s1:begin
			z = x ? 0:0;
			ns = x ? s1:s2;
		end
		s2:begin
			z = x ? 0:0;
			ns = x ? s1:s3;
		end
		s3:begin
			z = x ? 0:0;
			ns = x ? s4:s0;
		end
		s4:begin
			z = x ? 0:1;
			ns = x ? s1:s0;
		end
		endcase
		endmodule
