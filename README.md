# UART Transmitter (Verilog)

## Overview
Synthesizable Verilog implementation and testbench verification for a configurable UART Transmitter module.

## Architecture & Verification
* **Design:** Baud rate generator, frame formatting (Start, Data, Parity, Stop bits), and transmission control FSM.
* **Verification Strategy:** Directed testbenches created in QuestaSim/ModelSim to verify cycle-accurate bit timing, parity accuracy, and system reset behavior.

## Tools Used
* **HDL:** Verilog
* **Simulation:** QuestaSim
* **Linting:** SpyGlass
* **Synthesis:** Synopsis
