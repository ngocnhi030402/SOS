module adder_seq(
    clk, out, carry_out, in1, in2
);

    input clk;
    input [31:0]in1, in2;
    output reg[31:0]out;
    output reg carry_out;
    reg carry0, carry1;

    reg [7:0]r0_0, r0_1;
    reg[15:8]r1_0, r1_1;
    reg[31:16]r2_0, r2_1;
    

    always @(posedge clk) begin
        r0_0 <= in1[7:0];
        r0_1 <= in2[7:0];
        r1_0 <= in1[15:8];
        r1_1 <= in2[15:8];
        r2_0 <= in1[31:16];
        r2_1 <= in2[31:16];


        {carry0, out[7:0]} <= r0_0 + r0_1;
        {carry1, out[15:8]} <= r1_0 + r1_1 + carry0;
        {carry_out, out[31:16]} <= r2_0 + r2_1 + carry1;
    end

endmodule