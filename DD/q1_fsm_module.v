module fsm (clk,rst,I,Z);

	input clk,rst,I;
	output Z;
	wire clk,rst,I ;
	reg Z;

	parameter A = 2'b00, B = 2'b01, C = 2'b10; // 3 states fsm
	reg [1:0]S ;  // state vector


	initial	// initially let the state be at A, 00
	begin
		S = A;
	end

	// ALL THE STATES CHANGE AFTER A SECOND OF DELAY, THIS HELPS
	// TO MAKE OUTPUT PROPER
	always @(posedge clk or posedge rst) // asynchronus reset condition
	begin
		if(rst)
		begin
			S <= #1 A;
		end

		else
			case(S)
			A: if(I == 0)	// 00
				begin
				S <= #1 B;
				Z <= 0;
				end
			else
				begin
				S <= #1 C;
				Z <= 0;
				end

			B: if(I==0)	//01
				begin
				Z <= 0;
				end
			else
				begin
				S <= #1 C;
				Z <= 1;
				end

			C: if(I==1)	//10
				begin
				Z <= 0;
				end
			else
				begin
				S <= #1 B;
 				Z <= 1;
				end
			endcase
	end
endmodule


