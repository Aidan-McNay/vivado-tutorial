// =======================================================================
// gray_code_test.sv
// =======================================================================
// A testbench for our Gray code counter

`include "gray_code.sv"

logic [3:0] gray_code_values [16] = '{
  4'b0000,
  4'b0001,
  4'b0011,
  4'b0010,
  4'b0110,
  4'b0111,
  4'b0101,
  4'b0100,
  4'b1100,
  4'b1101,
  4'b1111,
  4'b1110,
  4'b1010,
  4'b1011,
  4'b1001,
  4'b1000
};

module GrayCodeTest;

  // ---------------------------------------------------------------------
  // Instantiate the DUT
  // ---------------------------------------------------------------------

  logic clk, rst, en;
  logic [3:0] dut_gray_count;

  GrayCode dut (
    .clk        (clk),
    .rst        (rst),
    .en         (en),
    .gray_count (dut_gray_count)
  );

  // ---------------------------------------------------------------------
  // Toggle the clock
  // ---------------------------------------------------------------------

  initial clk = 1'b1;
  always #5 clk = ~clk;

  // ---------------------------------------------------------------------
  // Exhaustive testing
  // ---------------------------------------------------------------------

  assign en = 1'b1;

  initial begin
    rst = 1'b1;
    @( posedge clk );
    @( posedge clk );
    rst = 1'b0;

    for( int i = 0; i < 16; i = i + 1 ) begin
      assert( dut_gray_count == gray_code_values[i] );
      @( posedge clk );
    end

    $display( "All tests passed!" );
    $finish;
  end

endmodule
