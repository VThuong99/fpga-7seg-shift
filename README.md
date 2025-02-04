# FPGA-Based 7-Segment LED Shift Register

## Overview
This project implements a **7-segment LED shift register** using **Verilog HDL** on the **DE10 FPGA** board. The design allows displaying the last 4 digits of a student ID (MSSV) on **HEX5 → HEX0**, controlled by switches **SW0** and **SW1**.

## Features
- **Displays the last 4 digits** of a given student ID (e.g., `22200034` → shows `0034`).
- **Shifts the display left or right** based on **SW0**.
  - When the last (or first) digit reaches the end, the sequence wraps around.
  - Example of shifting left:
    ```
    0034-- → -0034- → --0034 → 4--003 → 34--00 → 034--0
    ```
- **Supports 1 Hz and 8 Hz shifting speeds** based on **SW1**.
- **Uses a 50 MHz clock** from the DE10 FPGA, with a clock divider to generate **1 Hz and 8 Hz** clock pulses.
- **Modular design**, including a separate clock divider module for accurate timing control.
- Optional **reset signal** for initialization.

## Project Structure
```
F:.
│   .gitignore (Ignored files)
│   README.md (Project documentation)
│   test.qpf (Quartus Project File)
│   test.qsf (Quartus Settings File)
│   test.v (Verilog Source Code)
│   c5_pin_model_dump.txt (Pin model data)
```

## Installation
1. Install [Intel Quartus Prime](https://www.intel.com/content/www/us/en/software/programmable/quartus-prime.html)
2. Clone this repository:
   ```sh
   git clone https://github.com/VThuong99/fpga-7seg-shift.git
   ```
3. Open `test.qpf` in Quartus Prime.

## Building and Synthesizing
1. Open the project in Quartus Prime.
2. Compile the design by clicking **Start Compilation**.
3. Generate the bitstream (`.sof` file) for FPGA programming.

## Usage
- Load the compiled project onto the FPGA.
- Connect the FPGA board and use:
  - **SW0** to control the shift direction.
  - **SW1** to toggle between **1 Hz** and **8 Hz** shifting speed.
- Observe the **7-segment LED display** shifting as per control inputs.

## Demo
[![Video Demo](https://img.youtube.com/vi/NjSZ2oingwU/0.jpg)](https://youtu.be/NjSZ2oingwU)

## Author
VThuong99