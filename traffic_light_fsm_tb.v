// traffic_light_fsm_tb.v
// Testbench for verifying the Traffic Light Controller FSM

`timescale 1ns / 1ps

module traffic_light_fsm_tb;

    reg clk;
    reg rst_n;
    wire [2:0] light;

    // Instantiate the Unit Under Test (UUT)
    traffic_light_fsm uut (
        .clk(clk),
        .rst_n(rst_n),
        .light(light)
    );

    // Generate a clock signal (period of 10ns)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0; // Apply active-low reset

        #15;
        rst_n = 1; // Release reset to start the FSM

        // Monitor state changes in console output
        $monitor("Time=%0dns | Reset=%b | Lights [R-Y-G]=%b", $time, rst_n, light);

        // Run simulation long enough to observe multiple full cycles
        #200;

        $finish;
    end

endmodule
