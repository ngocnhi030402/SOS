module adder_seq(
    clk, out, carry_out, in1, in2
);

    input clk;
    input [1023:0]in1, in2;
    output reg[1023:0]out;
    output reg carry_out;
    reg carry0, carry1, carry2;

    reg[255:0]r0_0, r0_1;
    reg[255:0]r1_0, r1_1;
    reg[255:0]r3_0, r3_1;
    reg[255:0]r2_0, r2_1;
    

    always @(posedge clk) begin
        r0_0 <= in1[255:0];
        r0_1 <= in2[255:0];
        r1_0 <= in1[511:256];
        r1_1 <= in2[511:256];
        r2_0 <= in1[767:512];
        r2_1 <= in2[767:512];
        r3_0 <= in1[1023:768];
        r3_1 <= in2[1023:768];


        {carry0, out[255:0]} <= r0_0 + r0_1;
        $display("out:%d", out);
        {carry1, out[511:256]} <= r1_0 + r1_1 + carry0;
         $display("out:%d", out);
        {carry2, out[767:512]} <= r2_0 + r2_1 + carry1;
         $display("out:%d", out);
        {carry_out, out[1023:768]} <= r3_0 + r3_1 + carry2;
    end

endmodule