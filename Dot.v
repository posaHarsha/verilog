module a9(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,clk,reset,y);
input [3:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9;
input [3:0] h0,h1,h2,h3,h4,h5,h6,h7,h8,h9;
input   reset,clk;
output reg [31:0]y;
reg [3:0] arr1[0:9];
reg [3:0] arr2[0:9];
integer i;
reg [7:0] arr3[0:9];
always @(*)
begin
arr1[0] <= x0;
arr1[1] <= x1;
arr1[2] <= x2;
arr1[3] <= x3;
arr1[4] <= x4;
arr1[5] <= x5;
arr1[6] <= x6;
arr1[7] <= x7;
arr1[8] <= x8;
arr1[9] <= x9;
arr2[0] <= h0;
arr2[1] <= h1;
arr2[2] <= h2;
arr2[3] <= h3;
arr2[4] <= h4;
arr2[5] <= h5;
arr2[6] <= h6;
arr2[7] <= h7;
arr2[8] <= h8;
arr2[9] <= h9;

end
always @(posedge clk or posedge reset)
begin
     y = 0;
    if(reset)
        y = 0;
     else 
     begin
        for(i=0; i<10 ; i++)
        y = y + arr1[i]*arr2[i];   
     end
end
endmodule



