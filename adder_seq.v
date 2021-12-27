module adder_seq(
    clk, out, carry_out, in1, in2
);

    input clk;
    input [1023:0]in1, in2;
    output reg[1023:0]out;
    output reg carry_out;
    reg carry0, carry1;

    reg [255:0]r0_0, r0_1;
    reg[255:0]r1_0, r1_1;
    reg[511:0]r2_0, r2_1;
    

    always @(posedge clk) begin
        r0_0 <= in1[255:0];
        r0_1 <= in2[255:0];
        r1_0 <= in1[511:256];
        r1_1 <= in2[511:256];
        r2_0 <= in1[1023:512];
        r2_1 <= in2[1023:512];


        {carry0, out[255:0]} <= r0_0 + r0_1;
        {carry1, out[511:256]} <= r1_0 + r1_1 + carry0;
        {carry_out, out[1023:512]} <= r2_0 + r2_1 + carry1;
    end

endmodule