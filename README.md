# FYS4200 study project - Kun

This is a study project for master course FYS4200.
Author: Kun Zhu

Development tools:
Quartus Prime: Lite and release 18.1
Quartus Prime (includes Nios II EDS)
Modelsim-Intel FPGA Edition (Includes Starter Edition)
MAX 10 FPGA device support

## The entire project consists of 4 modules:
* An introductory project (lab1) to FPGA.
* UART, personal tailored UART module.
* MCU, a microcontroller module using UART protocol for communicating between hardware and software.
* RTOS, real-time OS that reads from the onboard accelorometer.
* Description of each tasks and learning materials are listed on this link:
https://pages.github.uio.no/fys4220/fys4220/welcome.html


## Basic system with JTAG UART 
The first development step demonstrates a minimal version including only the CPU, the on-chip memory, and a JTAR UART. A basic "Hello, World!" software application makes use of the JTARG UART to communicate with the host PC. This version of the example is tagged "minimal" and can be viewed here:
https://github.uio.no/FYS4220/fys4220_nios2_example/tree/minimal-v2


Description: https://pages.github.uio.no/fys4220/fys4220/embedded/embedded_nios2_system.html


## Adding PIO cores
To demonstrate reading and writing to memory mapped modules PIO cores were added. The software application was extended to allow the slide switches to turn on and off the LEDs. This part of the development is tagged with "minimal-pio":
https://github.uio.no/FYS4220/fys4220_nios2_example/tree/minimal-pio

Description: https://pages.github.uio.no/fys4220/fys4220/embedded/embedded_memory_mapped_sw.html

## Adding interrupt
Interrupt handling for the Nios II example is demonstrated with a PIO-module connected to one of the push buttons on the DE10-Lite board. The part is tagged with
https://github.uio.no/FYS4220/fys4220_nios2_example/tree/minimal-pio-with-interrupt

Description: https://pages.github.uio.no/fys4220/fys4220/embedded/embedded_interrupt.html