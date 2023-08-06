module mux_2n #(parameter n = 3) (
  input [n-1:0] select,
  input [2^n-1:0] data_in,
  output reg data_out
);

  wire [2^(n-1)-1:0] lower_data_out;
  wire [2^(n-1)-1:0] upper_data_out;

  // Recursive 2×1 multiplexer
  generate
    if (n == 1) begin
      // Base case: 2×1 mux
      mux_2to1 mux (
        .select(select[0]),
        .data_in0(data_in[0]),
        .data_in1(data_in[1]),
        .data_out(data_out)
      );
    end else begin
      // Recursive case: Split the input and recursively call 2^n-1 multiplexers
      mux_2n #(n-1) lower_mux (
        .select(select[n-2:0]),
        .data_in(data_in[2^(n-1)-1:0]),
        .data_out(lower_data_out)
      );
      mux_2n #(n-1) upper_mux (
        .select(select[n-1]),
        .data_in(data_in[2^n-1:2^(n-1)]),
        .data_out(upper_data_out)
      );

      // Connect the outputs of the lower and upper multiplexers to the 2×1 multiplexer
      mux_2to1 mux (
        .select(select[n-1]),
        .data_in0(lower_data_out),
        .data_in1(upper_data_out),
        .data_out(data_out)
      );
    end
  endgenerate
endmodule

module mux_2to1 (
  input select,
  input data_in0,
  input data_in1,
  output reg data_out
);
  always @(select, data_in0, data_in1)
    if (select)
      data_out = data_in1;
    else
      data_out = data_in0;
endmodule
