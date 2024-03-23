module lab1_ex1 (
	input logic [7:0] A0,
	input logic clk, rst,
	output logic [0:0] overflow, Carry,
	output logic [7:0] sum
);

wire [7:0] A1, A2, A3;
wire [0:0] V_flag, cout;

D_FF8b dff8b0 (.clk(clk), .rst(rst), .data_i(A0), .data_o(A1));
FA8b fa8b1 (.sum(A2), .a(A1), .b(A3), .cin(1'b0), .cout(cout), .overflow(V_flag));
D_FF8b dff8b1 (.clk(clk), .rst(rst), .data_i(A2), .data_o(A3));
D_FF dff0 (.clk(clk), .rst(rst), .data_i(V_flag), .data_o(overflow));
D_FF dff1 (.clk(clk), .rst(rst), .data_i(cout), .data_o(Carry));

assign sum = A3;
endmodule : lab1_ex1