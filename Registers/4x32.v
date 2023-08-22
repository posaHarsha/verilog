// 4x32 register bank code
module registerbank(ra1,ra2,wa,clk,write,rdata1,rdata2,wdata);
input clk,write;
input [1:0] ra1,ra2,wa;
input [31:0] wdata;
output reg [31:0]  rdata1,rdata2;
reg [31:0] r0,r1,r2,r3;

always @(*)
begin
	case(ra1)
		0:rdata1=r0;
		1:rdata1=r1;
		2:rdata1=r2;
		3:rdata1=r3;
		default:rdata1=32'hxxxxxxxx;
	endcase
end

always @(*)
begin
	case(ra2)
		0:rdata2=r0;
		1:rdata2=r1;
		2:rdata2=r2;
		3:rdata2=r3;
		default:rdata2=32'hxxxxxxxx;
        endcase
end

always @(posedge clk)
begin
      if(write)
      begin
	case(wa)
		0:r0 = wdata;
		1:r1 = wdata;
		2:r2 = wdata;
		3:r3 = wdata;
		default:rdata1=32'hxxxxxxxx;
	endcase
      end		
end
endmodule
