module register(ra1,ra2,wa,clk,write,rdata1,rdata2,wdata);
input [31:0] wdata;
input [5:0] ra2,ra1,wa;
input write,clk;
output [31:0] rdata1,rdata2;
reg [31:0] mem [0:31] ;
assign rdata1 = mem[ra1];
assign rdata2 = mem[ra2];

always @(posedge clk)
begin
	if(write)
	begin
		mem[wa]=wdata;
	end
end
endmodule
