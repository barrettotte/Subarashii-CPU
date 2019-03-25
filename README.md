# Subarashii-CPU  &nbsp;&nbsp;&nbsp;&nbsp; すばらしい


Homebrew 8-bit RISC CPU that will be implemented in VHDL and on breadboards. 
This project will be done in phases to allow time for other side projects.


## Basic Specifications
* 8x8-bit registers
* 16-bit RISC instruction set
* 256x8-bit RAM data memory
* 256x8-bit ROM program memory


## Hardware Information
To make this easily storable and easy to work on, I will use document trays to make "layers".
<pre>
    +----------------------------------------+
    |     Control Module, Clock              |
    +----------------------------------------+
    |     Data + Program Memory              |
    +----------------------------------------+
    |     Power Distribution, TBD            |
    +----------------------------------------+
    |     Register Bank, other registers     |
    +----------------------------------------+
    |     ALU                                |
    +----------------------------------------+
</pre>

Rough current cost: $118.43  see [Parts.xlsx](https://github.com/barrettotte/Subarashii-CPU/tree/master/Documentation) for details.



<pre>
                        [ S U B J E C T   T O   C H A N G E ]
+-----------------------------------------------------------------------------------------+
|                               SUBARASHII INSTRUCTION SET                                |
+-------+----------+--------------------------------+-------------+---------+-------------+
| INDEX | MNEMONIC | DESCRIPTION                    | SYNTAX      | OP CODE | PARAMETERS  |
+-------+----------+--------------------------------+-------------+---------+-------------+
| 00    | JMP      | JUMP TO LINE                   | JMP N       |   00000 | XXXNNNNNNNN |
| 01    | BRC      | BRANCH IF CARRY                | BRC N       |   00001 | XXXNNNNNNNN |
| 02    | BRZ      | BRANCH IF ZERO                 | BRZ N       |   00010 | XXXNNNNNNNN |
| 03    | BRV      | BRANCH IF OVERFLOW             | BRV N       |   00011 | XXXNNNNNNNN |
| 04    | BRN      | BRANCH IF NEGATIVE             | BRN N       |   00100 | XXXNNNNNNNN |
| 05    | JTS      | JUMP TO SUBROUTINE             | JTS N       |   00101 | XXXNNNNNNNN |
| 06    | RET      | RETURN FROM SUBROUTINE         | RET         |   00110 | XXXXXXXXXXX |
| 07    | ---      | ---                            | ---         |   00111 | ----------- |
| 08    | ADDI     | ADD IMMEDIATE TO RD            | ADDI RD,N   |   01000 | DDDNNNNNNNN | 
| 09    | SUBI     | SUBTRACT IMMEDIATE FROM RD     | SUBI RD,N   |   01001 | DDDNNNNNNNN |
| 10    | ANDI     | LOGICAL AND RD WITH IMMEDIATE  | ANDI RD,N   |   01010 | DDDNNNNNNNN |
| 11    | ORI      | LOGICAL OR RD WITH IMMEDIATE   | ORI  RD,N   |   01011 | DDDNNNNNNNN |
| 12    | LDI      | LOAD IMMEDIATE TO RD           | LDI RD,N    |   01100 | DDDNNNNNNNN |
| 13    | LDD      | DIRECT LOAD FROM DATA MEMORY   | LDD RD,[N]  |   01101 | DDDNNNNNNNN |
| 14    | SDD      | DIRECT STORE TO DATA MEMORY    | SDD [N],RD  |   01110 | DDDNNNNNNNN |
| 15    | NOT      | LOGICAL NOT RD                 | NOT RD      |   01111 | DDDXXXXXXXX |
| 16    | ADD      | ADD RS TO RD                   | ADD RD,RS   |   10000 | DDDSSSXXXXX |
| 17    | SUB      | SUBTRACT RS FROM RD            | SUB RD,RS   |   10001 | DDDSSSXXXXX |
| 18    | AND      | LOGICAL AND RD WITH RS         | AND RD,RS   |   10010 | DDDSSSXXXXX |
| 19    | OR       | LOGICAL OR RD WITH RS          | OR  RD,RS   |   10011 | DDDSSSXXXXX |
| 20    | LID      | INDIRECT LOAD FROM DATA MEMORY | LID RD,[RS] |   10100 | DDDSSSXXXXX |
| 21    | SID      | INDIRECT STORE TO DATA MEMORY  | SID [RD],RS |   10101 | DDDSSSXXXXX |
| 22    | PUSH     | PUSH DATA TO STACK             | PUSH RS     |   10110 | SSSXXXXXXXX |
| 23    | POP      | POP DATA FROM STACK            | POP RD      |   10111 | DDDXXXXXXXX |
| 24    | ---      | ---                            | ---         |   11000 | ----------- |
| 25    | SHL      | SHIFT REGISTER LEFT            | SHL RD      |   11001 | DDDXXXXXXXX |
| 26    | SHR      | SHIFT REGISTER RIGHT           | SHR RD      |   11010 | DDDXXXXXXXX |
| 27    | SWAP     | SWAP NIBBLES OF RD             | SWAP RD     |   11011 | DDDXXXXXXXX |
| 28    | ---      | ---                            | ---         |   11100 | ----------- |
| 29    | ---      | ---                            | ---         |   11101 | ----------- |
| 30    | ---      | ---                            | ---         |   11110 | ----------- |
| 31    | HLT      | HALT PROCESSOR                 | HLT         |   11111 | XXXXXXXXXXX |
+-------+----------+--------------------------------+-------------+---------+-------------+

+--------+-------------+     +------+---------------+
| LETTER | DESCRIPTION |     | FLAG |  DESCRIPTION  |
+--------+-------------+     +------+---------------+
| X      | UNASSIGNED  |     | C    | CARRY FLAG    |
| D      | DESTINATION |     | Z    | ZERO FLAG     |
| S      | SOURCE      |     | V    | OVERFLOW FLAG |
| N      | NUMBER      |     | N    | NEGATIVE FLAG |
+--------+-------------+     +------+---------------+
</pre>


## Phases
- [x] Phase I
  - [x] Design overall CPU and ISA, plan as much as I can
  - [x] Clock module
  - [x] 8x8-bit registers (4 of 8) and 8-bit data bus
  - [x] Start documenting ISA, schematics, and parts used
  - [x] "Power Supply" Module (bypass capacitors, star distribution, etc.)
  - [x] Register bank with register selection
  - [x] VHDL and breadboard implementations of Phase I
- [ ] Phase II
  - [ ] Data bus traversal between computer "layers"
  - [ ] ALU with all required functionality
  - [ ] 256x8-bit RAM with EEPROM
  - [ ] 8-bit Memory Address Register
  - [ ] VHDL and breadboard implementations of Phase II
- [ ] Phase III
  - [ ] Program counter and 8-bit program bus
  - [ ] 256x8-bit ROM with EEPROM
  - [ ] 7-segment decoder with EEPROM
  - [ ] 7-segment display
  - [ ] VHDL and breadboard implementations of Phase III
- [ ] Phase IV
  - [ ] Control module
  - [ ] 8-bit Instruction Register
  - [ ] Microcoding via dip switches
  - [ ] VHDL and breadboard implementations of Phase IV
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
* A "high level" language that compiles down to Subarashii ASM
* An "Operating System" (If you can call it that at this point?)
* TCP/IP?


## Repository Details
| Directory            | Description                                               |
| -------------------- | --------------------------------------------------------- |
| [Documentation](https://github.com/barrettotte/Subarashii-CPU/tree/master/Documentation) | All documentation related to the Subarashii-CPU |
| [Implementation-Breadboard](https://github.com/barrettotte/Subarashii-CPU/tree/master/Implmentation-Breadboard) | Pictures of Breadboard implementation of Subarashii-CPU | 
| [Implementation-VHDL](https://github.com/barrettotte/Subarashii-CPU/tree/master/Implementation-VHDL) | VHDL implmentation of Subarashii-CPU |
| [Schematics](https://github.com/barrettotte/Subarashii-CPU/tree/master/Schematics) | Block diagrams and basic schematics |
| [Testbenches](https://github.com/barrettotte/Subarashii-CPU/tree/master/Testbenches) | VHDL testbenches |


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
