module float_adder(a,b,z);
input [31:0] a, b;
output  [31:0] z;
wire sign_a,sign_b;
wire [7:0] exp_a,exp_b;
wire [22:0] frac_a,frac_b;

assign sign_a = a[31];
assign sign_b = b[31];
assign exp_a = a[30:23];
assign exp_b = b[30:23];
 assign frac_a = a[22:0];
 assign frac_b = b[22:0];
 
 reg [7:0] smaller_exp;
 reg [23:0] norm_a, norm_b,final_a,final_b;
 reg [24:0] add_result;
 reg [7:0] final_exp;
 reg overflow;

 reg out_sign;
 assign z = {out_sign,final_exp,add_result[22:0]};
 always @(*)
 begin
         smaller_exp = (exp_a < exp_b) ? exp_a :  exp_b;
         norm_a = {1'b1,frac_a} >> (exp_b - smaller_exp);
         norm_b = {1'b1,frac_b} >> (exp_a - smaller_exp);
         final_a = (sign_a == 1) ? ~norm_a + 1 : norm_a;
         final_b = (sign_b == 1) ? ~norm_b + 1 : norm_b;
         add_result = final_a + final_b;
         final_exp= (exp_a > exp_b) ? exp_a : exp_b;	 
         overflow = (add_result[24] == 1'b1);
         
             if(overflow)
                out_sign = sign_a;
             else if (exp_a > exp_b)
                out_sign = sign_a;
             else if (exp_b > exp_a)
                 out_sign = sign_b;
            else 
                 out_sign = sign_a ^ sign_b ;
                 
            
end

   endmodule
 
