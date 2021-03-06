
`timescale 1 ns / 1 ps

  module EdgeDetect_Top_mul_mul_23s_17ns_40_1_DSP48_6(a, b, p);
input signed [23 - 1 : 0] a; 
input [17 - 1 : 0] b; 
output signed [40 - 1 : 0] p; 

assign p = $signed (a) * $signed ({1'b0, b});

endmodule

`timescale 1 ns / 1 ps
module EdgeDetect_Top_mul_mul_23s_17ns_40_1(
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



EdgeDetect_Top_mul_mul_23s_17ns_40_1_DSP48_6 EdgeDetect_Top_mul_mul_23s_17ns_40_1_DSP48_6_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

