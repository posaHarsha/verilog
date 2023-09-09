module Datapath(lda,ldb,ldp,clrp,clk,data_in);
input lda,ldb,ldp,clrp,clk;
input [6:0] data_in;
wire[6:0] Bus;
wire [6:0] A,B;
wire [9:0] C;
wire [10:0] Z,P;

assign Bus = data_in;

register r1(Bus,A,lda,clk);
register r2(Bus,B,ldb,clk);
Multiplier m1(A,B,C,clk);
Adder a1(C,P,Z,clk);
Reggister r3(Z,P,clk,ldp,clrp);
endmodule

module register(x,y,ld,clk);
input [6:0] x;
output reg [6:0]y;
input ld,clk;
always @(posedge clk)
begin
	if(ld)
		y = x;
end
endmodule

module Multiplier(x,y,z,clk);
input [6:0] x,y;
input clk;
output reg [9:0] z;
always @(posedge clk)
begin
	z = x*y;
end
endmodule

module Adder(x,y,z,clk);
input [9:0] x;
input [10:0] y;
input clk;
output reg [10:0] z;
always @(posedge clk)
begin
	z = x+y;
end
endmodule

module Reggister(x,y,clk,ld,clr);
input [10:0] x;
output reg[10:0] y;
input clr,ld,clk;
always @(posedge clk)
begin
	if(ld)
		y=x;
	else if(clr)
		y=0;
end
endmodule

module Controlpath(start,stop,done,lda,ldb,ldp,clrp,clk);
input clk,start,stop;
output reg lda,ldb,ldp,clrp,done;

reg [2:0] state;
parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4=3'b100, s5=3'b101;

always @(posedge clk)
begin
           case(state)
           s0: if(start) #1 state = s1;
           s1: #1 state = s2;
           s2: #1 begin
                 if(stop) 
                         state = s5;
                 else    
                         state = s3;
                  end
           s3: #1  begin
                 if(stop) 
                         state = s5;
                 else    
                         state = s4;
                  end
           s4: #1 begin
                 if(stop) 
                         state = s5;
                 else    
                         state = s2;
                  end
           s5: state = s5;
           default: state = s0;
           endcase
end

always @(posedge clk)
begin
           case(state)
           s0: #2 begin lda = 0; ldb=0; ldp=0; clrp=0; done=0; end
           s1: #2 clrp=1;
           s2: #2 begin lda=1; clrp=0; ldp =0;end
           s3: #2 begin ldb=1; lda=0; ldp =0; end
           s4: #2 begin ldp = 1; ldb=0; end
           s5: #2 begin done = 1; ldp = 0; end
           default: #2 begin lda = 0; ldb=0; ldp=0; clrp=0; done=0; end
           endcase
end
endmodule















