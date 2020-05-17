## To run verilog file:
```
$ iverilog mysim file1.v file2.v
$ vvp mysim
```

# Assignment-1

Q1) Write a verilog code to define the following FSM. Testbench should test all states and combinations
For eg- 0/0 in the FSM means, input = 0 in that state and output=0

<img src="q1_question.png" height=300>

### Answer
* [FSM MODULE](q1_fsm_module.v)


* [TESTBENCH MODULE](q2_testbench_module.v)

Q2) Two verilog files (q0_counter.v, q1_alu.v) – counter and ALU, with errors,have been uploaded. You are required to debug
the errors, and fix them

### Answer

* [q0_counter](q2_q0.v)
* [q1_alu](q2_q1.v)

# Assignment-2
 
Q) Write a behavioral Verilog module for a modified form of traffic light controller FSM. It has 2 sensor inputs TA and TB and 6 traffic light outputs – 3 per lane  (and a clock CLK and reset RST).  The FSM behaves similar to the TLC FSM described in the text book with the difference that a YELLOW signal condition for a lane is for 2 cycles. Therefore the total number of states is 6 (S0 – S5). Write a test-bench that covers the usual traffic conditions.  Use parameter statement for describing the state constants to simplify the code. Write a test-bench that illustrates the correct operation of the FSM.  

### Answer 
* [Traffic Light FSM Module](Traffic_light.v)

* [Test Bench Module](Test_bench.v)

* [Report PDF](a2_report.pdf)
