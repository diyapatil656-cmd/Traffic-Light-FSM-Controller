# Traffic Light Controller (Verilog FSM)

## Project Overview
This repository features a synchronous **Traffic Light Controller** designed using a 3-state Finite State Machine (FSM) architecture in Verilog. It serves as a practical implementation demonstrating structural control flow, clock-based counters, and sequential logic design patterns.

## State Sequence
The system loops continuously through standard traffic light phases based on a unified counter threshold:
* **Green Light** (`001`) ➔ Active state for safe vehicle progression.
* **Yellow Light** (`010`) ➔ Alert transition state.
* **Red Light** (`100`) ➔ Stop state.

## Repository Contents
* `/traffic_light_fsm.v` : Hardware design implementation (RTL code).
* `/traffic_light_fsm_tb.v` : Functional stimulus verification testbench.

