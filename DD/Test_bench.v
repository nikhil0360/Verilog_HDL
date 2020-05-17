module test_bench();

reg s1,s2,clk,rst ;
wire [1:0] t1,t2 ;
traffic_light myfsm(s1,s2,t1,t2,clk,rst);

always
	begin
	clk = 0;
	#2;
	clk = 1;
	#2;
	end

initial
	begin

		$dumpfile("traffic_light.vcd");
		$dumpvars(0,test_bench);
		$monitor ($time," la=%b lb=%b",t1,t2);
		s1 = 1; s2 = 0; rst = 1; #3
        rst = 0 ; #15
        s1 = 0; s2 = 0; #15
        s1 = 0; s2 = 1; #15
        s1 = 1; s2 = 1; #15
		$finish;
	end
endmodule

