module traffic_light(ta,tb,la,lb,clock,reset);
input ta,tb,reset,clock;
output [1:0] la,lb;


reg [2:0] state, next_state ;
reg flag, flag2 ;
// state parameters
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b101;
parameter S3 = 3'b010;
parameter S4 = 3'b011;
parameter S5 = 3'b111;

/*
parameter GREEN = 2'b00;
parameter YELLOW = 2'b01;
parameter RED = 2'b10;
*/


// state register
always @ (posedge clock or posedge reset)
if(reset) state <= S0 ;
else state <= next_state ;


// next state logic
always @ (*)
case(state)
    S0: if(~ta) next_state <= S1;
        else next_state <= S0;
    S1: next_state <= S2;
    S2: next_state <= S3;
    S3: if(~tb) next_state <= S4;
    S4: next_state <= S5;
    S5: next_state <= S0;
endcase

// output logic
assign la[1] = state[1];
assign la[0] = (~state[1]) & state[0];
assign lb[1] = ~state[1];
assign lb[0] = state[0] & state[1];

endmodule
