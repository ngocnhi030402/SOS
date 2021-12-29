module bitaddertb;
    initial begin
        $dumpfile("bitaddertb.vcd");
        $dumpvars(0, bitaddertb);
    end
    // Inputs
    reg [1023:0] in1;
    reg [1023:0] in2;
    reg clk;
    // Outputs
    wire[1023:0] out;
    wire carry_out;  
    wire[1023:0]carry;

    // Instantiate the Unit Under Test (UUT)
    adder_seq uut (
        .clk(clk),
        .carry_out(carry_out),
        .out(out),
        .in1(in1), 
        .in2(in2)
    );
    //always #5 clk = ~clk;
initial begin: initial_block
        begin: my_for_block
           in1=1110000100000100110111001001111111000001001001000001001000101001010111010011110000011001110001100001001011001001100101100010000001101100000110001101101011101001001111110011000001001101010011110101101110010100001001100011100000110100010000000100001000010101101101101101101000000111111110110100010011110010010000010001000110011001100101111101011111110010010110110101100111101110000000010000111100101110011111110010111110001101000110010100110110000000001111010101001110000101001101010001010000011000101101010101010001111000011100100100110010001101110001001010111011000111000110111111100010101110110111001100000110000010101101101110011011011010000000000100000001100011101100111101110011001100101000001100000110000110101110100011000101110000111111101111110000001001001010000111110010111001110010001101100111011000101010001101101101110101001010100000010001111010000010001001000111110110101010001100010001000101000010010010100011100101101101111011110010010011100011000011111111101010100100000110000110001101111010000000010101000101; 
           #100;
           in2=0001010001111000101011011111000110101110110111111010101001100000001010011011000100111110010110000101000101011000001101111011101111010010100010001011001101101000000111111001111000111110011000100011000101110010101111111110000001000011100010011100110000011001010111000100010011110111110001110000000111010101011010100011000101001011011000001001101110011110111000000011000011100110101101100101100111110100011111110111001111111000100000110111110011001010100101100101010000101111010111101111011100100001100101110001110000001111110111101000110011110010100110110110001100000111010011100100110100010110111110001011101010010000101110000001001101110100001110011110101001010101110000111000001001001011101100011011100001010110110111110100010000101000100000001100000111000111001010000000100001001011010011010101111110010101100010000010110010111100001101011001000111011111111110011010111110100000101011011000000101011111101001110000110110111011100111000100101101101101100110100001110011001010000100010001010011000011111010010100111000101111;
           $display("in1:%d, in2:%d",in1,in2);   
        end 
      $finish;
end

    genvar i;
   generate 
   for(i=0;i<1024;i=i+1)
     begin: generate_bitaddertb
   if(i==0) 
  half_adder f(in1[0],in2[0],out[0],carry[0]);
   else
  full_adder f(in1[i],in2[i],carry[i-1],out[i],carry[i]);
     end
  assign carry_out = carry[1023];
   endgenerate
    
endmodule



