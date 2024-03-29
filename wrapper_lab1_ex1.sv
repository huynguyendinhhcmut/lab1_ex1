module wrapper_lab1_ex1 (
	input logic [7:0] SW,
	input logic [1:0] KEY,
	output logic [9:0] LEDR,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3
);

assign LEDR[7:0] = sum [7:0];
wire [7:0] sum, A;
assign A = SW;

lab1_ex1 lab1ex1 (.A0(A), .sum(sum), .Carry(LEDR[8]), .overflow(LEDR[9]), .clk(KEY[1]), .rst(KEY[0]));
display_hex displayhex2 (.data_in(A[3:0]), .display_out(HEX2));
display_hex displayhex3 (.data_in(A[7:4]), .display_out(HEX3));
display_hex displayhex0 (.data_in(sum[3:0]), .display_out(HEX0));
display_hex displayhex1 (.data_in(sum[7:4]), .display_out(HEX1));

endmodule
