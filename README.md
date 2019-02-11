# Subarashii-CPU


Homebrew 8-bit RISC CPU that will be implemented in VHDL and on breadboards. 
This project will be done in phases to allow time for other side projects.


## Basic Specifications
* 8x8-bit registers
* 16-bit RISC instruction set
* 256x8-bit RAM data memory
* 256x8-bit ROM program memory


## Instruction Set
[![Instruction-Set](https://github.com/barrettotte/Subarashii-CPU/blob/master/Documentation/ISA.PNG)](https://raw.githubusercontent.com/barrettotte/Subarashii-CPU/master/Documentation/ISA.PNG)


## Phases
- [ ] Phase I
  - [x] Design overall CPU and ISA, plan as much as I can
  - [x] Clock module
  - [x] 4x8-bit registers (4 of 8) and 8-bit data bus
  - [ ] ALU with all required functionality
  - [ ] Start documenting ISA, schematics, and parts used
  - [ ] Finish VHDL and breadboard implementations of Phase I
- [ ] Phase II
  - [ ] 4x8-bit registers (8 of 8)
  - [ ] 256x8-bit RAM with EEPROM
  - [ ] 8-bit Memory Address Register
  - [ ] Finish VHDL and breadboard implementations of Phase II
- [ ] Phase III
  - [ ] Program counter and 8-bit program bus
  - [ ] 256x8-bit ROM with EEPROM
  - [ ] 7-segment decoder with EEPROM
  - [ ] 7-segment display
  - [ ] Finish VHDL and breadboard implementations of Phase III
- [ ] Phase IV
  - [ ] Control module
  - [ ] 8-bit Instruction Register
  - [ ] Microcoding via dip switches
  - [ ] Finish VHDL and breadboard implementations of Phase IV
- [ ] Phase V
  - [ ] Make actual schematics for everything (Make it pretty)
  - [ ] Finish documenting parts used in project
  - [ ] Write a basic assembler
  - [ ] Program loader with EEPROM and Arduino Zero
  - [ ] Write some basic programs
  - [ ] Document assembly language
- [ ] Phase VI
  - [ ] Expand RAM and ROM sizes
  - [ ] Implement stack logic in hardware and assembler
  - [ ] Console interaction via Serial Port


## Possible Future Goals (AKA stuff I have absolutely no idea how I would do...yet)
* Barrel Shifter (Shift left/right by n in minimal clock cycles)
* Video Card?
* Keyboard interface via serial or PS/2 ?
* Sound Card?
* An "Operating System" (If you can call it that at this point?)
* TCP/IP?


## Repository Details
| Directory            | Description                                               |
| -------------------- | --------------------------------------------------------- |
| [Documentation](https://github.com/barrettotte/Subarashii-CPU/tree/master/Documentation) | All documentation related to the Subarashii-CPU |
| [Implementation-Breadboard](https://github.com/barrettotte/Subarashii-CPU/tree/master/Implmentation-Breadboard) | Breadboard implementation of Subarashii-CPU | 
| [Implementation-VHDL](https://github.com/barrettotte/Subarashii-CPU/tree/master/Implementation-VHDL) | VHDL implmentation of Subarashii-CPU |
| [Misc\Intro-VHDL](https://github.com/barrettotte/Subarashii-CPU/tree/master/Misc/Intro-VHDL) | Introduction to VHDL and computer architecture || [Testbenches](https://github.com/barrettotte/Subarashii-CPU/tree/master/Testbenches) | VHDL testbenches |


## Sources
* ALU References
  * http://www.learnabout-electronics.org/Digital/dig58.php
* Homebrew CPU References
  * http://www.homebrewcpu.com/
  * https://www.ttlcpu.com/content/links
* ISA References
  * RISV-V https://riscv.org/
  * Tiny RISC-V https://www.csl.cornell.edu/courses/ece4750/handouts/ece4750-tinyrv-isa.txt
  * MIPS16 http://www.ijsrp.org/research-paper-0413/ijsrp-p16126.pdf
* Microprocess Design WikiBook https://en.wikibooks.org/wiki/Microprocessor_Design
* Nand2Tetris Coursera https://www.coursera.org/learn/build-a-computer/home/info
* VHDL / Verilog Tutorials https://www.nandland.com/
