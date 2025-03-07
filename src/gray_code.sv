// =======================================================================
// gray_code.sv
// =======================================================================
// A 4-bit Gray code counter

`ifndef GRAY_CODE_SV
`define GRAY_CODE_SV

module GrayCode (
  input  logic       clk,
  input  logic       rst,
  input  logic       en,

  output logic [3:0] gray_count
);

  // Regular counter
  logic [3:0] count;

  always_ff @( posedge clk ) begin
    if( rst )
      count <= 4'b0;
    else if( en )
      count <= count + 4'b1;
  end

  // Convert to gray code
  assign gray_count = count ^ (count >> 1);

endmodule

`endif // GRAY_CODE_SV
