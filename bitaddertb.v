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
    wire [1023:0] out;
    wire carry_out;  
    wire[1023:0]carry;
    //integer i,j,error;

    // Instantiate the Unit Under Test (UUT)
    adder_seq uut (
        .clk(clk),
        .out(out),
        .carry_out(carry_out),
        .in1(in1), 
        .in2(in2)
    );
    //always #5 clk = ~clk;
initial begin
    in1 = 21344564758693763245335254642865;
    in2 = 67837467766797693476155544324903;
    #100;
end

    genvar i;
   generate 
   for(i=0;i<1023+1;i=i+1)
     begin: generate_bitaddertb
   if(i==0) 
  half_adder f(in1[0],in2[0],out[0],carry[0]);
   else
  full_adder f(in1[i],in2[i],carry[i-1],out[i],carry[i]);
     end
  assign carry_out = carry[1023];
   endgenerate
    
endmodule