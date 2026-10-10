// traffic_light_fsm.v
// A synchronous Traffic Light Controller using a Finite State Machine (FSM).

module traffic_light_fsm (
    input clk,            // Clock signal
    input rst_n,          // Active-low asynchronous reset
    output reg [2:0] light // 3-bit output: [2]=Red, [1]=Yellow, [0]=Green
);

    // Define state encodings using parameters
    parameter S_GREEN  = 2'b00,
              S_YELLOW = 2'b01,
              S_RED    = 2'b10;

    reg [1:0] current_state, next_state;
    reg [3:0] clk_counter; // Counter to keep track of timing cycles

    // State Transition Logic (Sequential Block)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= S_GREEN;
            clk_counter   <= 4'd0;
        end else begin
            if (clk_counter >= 4'd7) begin // Change state every 8 clock cycles
                current_state <= next_state;
                clk_counter   <= 4'd0;
            end else begin
                clk_counter   <= clk_counter + 1'b1;
            end
        end
    end

    // Next State Logic (Combinational Block)
    always @(*) begin
        case (current_state)
            S_GREEN:  next_state = S_YELLOW;
            S_YELLOW: next_state = S_RED;
            S_RED:    next_state = S_GREEN;
            default:  next_state = S_GREEN;
        endcase
    end

    // Output Logic based on current state
    always @(*) begin
        case (current_state)
            S_GREEN:  light = 3'b001; // Green ON
            S_YELLOW: light = 3'b010; // Yellow ON
            S_RED:    light = 3'b100; // Red ON
            default:  light = 3'b100; 
        endcase
    end

endmodule
