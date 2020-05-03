module testbench ;
	reg a,clk,rst;
	wire z;
	fsm testfsm(clk,rst,a,z);

	always
		begin
		clk = 0;
		#1;
		clk = 1;
		#1;
		end

	initial
	begin

		$dumpfile("fsm.vcd");
		$dumpvars(0,testbench);
		$monitor ($time," a=%b  z=%b",a,z);
		#3 a = 1 ; rst = 0;   // this will take us to state C
		#3 a = 0 ;	// this will take us to state B
		#3 a = 1 ;	// this will take us to state C
		#3 a = 0 ;
		rst = 1;	// reset
		#1; rst = 0 ;	// Back to state A
		#2 a = 0 ;	// A --> B
		#3 a = 1 ;	// B --> C
		#3 a = 0 ;	// C --> B
		#3 a = 1 ;	// B --> C
		#3 $finish;
	end
endmodule
