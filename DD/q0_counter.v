//This is a Johnson counter
//0, 1, 3, 7, F, E, C, 8, 0, repeat

module dff(q,d,clk,reset);  //// D flip flop module
output q;
input d,clk,reset;
reg q;

always@(posedge clk or reset)
// posedge reset, to ensure asynchronous reset

begin
	if (reset==1) q=0;
	else q=d;
end
endmodule



module counter(q,reset,clk);
output [3:0]q;
input clk,reset;
reg w;

//// removed 'Initial' statement as this comes under
//// procedural assignment
//// if not removed, gives error of malformed statement
//// this should be continuous assignment 

initial begin
not n1 (q[3],w);
dff f1(q[0],w,reset,clk);
dff f2(q[1],q[0],reset,clk);
dff f3(q[2],q[1],reset,clk);
dff f4(q[3],q[2],reset,clk);
end
endmodule

`timescale 10ns/1ps
module tb_johnson;
    // Inputs
    reg clock;
     reg r;
    // Outputs
    wire Count_out;
//// change wire Count_out --> [3:0]Count_out
//// ( should be a vector of size 4 bit )

//in this following notation you have to pass the signals in the same order
//as in the original module
counter uut (Count_out,clock,r); 


//alternately, the following notation means that clk in the module connects to clock in the testbench.
//reset connects to r, and q to Count_out.
//In this notation, you can pass signals in any order, as you are explicitly mentioning 
//the signal connections

//  counter uut ( .clk(clock),  .reset(r),.q(Count_out) );


initial begin


clk = 0;  ////clk --> clock
r=1;
#50 r=0;  //reset=1 never shows up on the waveform -- why?

$dumpfile ("counter.vcd");  //// counter_test --> tb_johnson
$dumpvars(0,counter_test);  

end

always 
#3 clk=~clk;   //// clk ---> clock , wrong name 


//initial #300 $finish;

endmodule
