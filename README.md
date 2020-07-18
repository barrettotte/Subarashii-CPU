# Subarashii-CPU

A 16-bit RISC CPU inspired by MIPS. 
I designed this to learn more about computer architecture/organization.


## Specifications
* 16-bit RISC
* Harvard architecture
* single cycle execution
* 16 x 16-bit registers
* 64KB ROM with 16-bit instructions
* 64KB RAM
* Memory mapped I/O


## Instruction Set
| Opcode | Syntax          | Logic                  | Description                                             |
| ------ | --------------- | ---------------------- | ------------------------------------------------------- |
| 0000   | ```ADD R1,R2,R3```    | R1 = R2 + R3           | register addition                                       |
| 0001   | ```SUB R1,R2,R3```    | R1 = R2 - R3           | register subtraction                                    |
| 0010   | ```AND R1,R2,R3```    | R1 = R2 & R3           | logical AND                                             |
| 0011   | ```ORR R1,R2,R3```    | R1 = R2 | R3           | logical OR                                              |
| 0100   | ```NOT R1,R2,R0```    | R1 = ~R2               | logical NOT                                             |
| 0101   | ```XOR R1,R2,R3```    | R1 = R2 ^ R3           | logical XOR                                             |
| 0110   | ```LSR R1,R2,R0```    | R1 = R2 >> 1           | logical shift right                                     |
| 0111   | ```LSL R1,R2,R0```    | R1 = R2 << 1           | logical shift left                                      |
| 1000   | ```ADI R1,00001111``` | R1 += 0000000000001111 | Add immediate to R1                                     |
| 1001   | ```SWP R1,R2,R3```    | R1 = R2[HI] R3[LO]     | Swap bytes of registers                                 |
| 1010   | ```LDW R1,R2,R0```    | R1 = [R2]              | load word into R1 from memory address R2                |
| 1011   | ```STW R0,R2,R1```    | [R2] = R1              | store word in R1 at memory address R2                   |
| 1100   | ```BRZ R0,R1,R2```    | PC = R1-0=Z ? R2 : PC  | relative branch to R2 if result of R1-0 sets zero flag  |
| 1101   | ```JAL R1,R2```       | R1 = PC+2 ; PC = R2    | jump to address R2 and link to R1                       |
| 1110   | ``` ```               |                        |                                                         |
| 1111   | ``` ```               |                        |                                                         |


Note: I left two instructions open so I can add new features or any missing functionality; I'm sure I missed something.



## Register Set
* R0     - zero register
* R1-R11 - general purpose
* R12    - scratch register 
* R13    - status register (flags, control, errors)
* R14    - link register
* R15    - stack pointer

For now, I have not simulated these with Verilog. 
These are most likely to change after experimenting more.


## Status Flags
These flags are also very likely to change in the future.

| Index | Flag | Description          |
| ----- | ---- | -------------------- |
| 0     | Z    | Zero                 |
| 1     | C    | Carry                |
| 2     | N    | Negative             |
| 3     | V    | Overflow             |
| 4     | U    | Reserved             |
| 5     | E    | Exception            |
| 6     | M    | CPU Mode             |
| 7     | IE   | Interrupt Enable     |
| 8     | I0   | Software Interrupt 1 |
| 9     | I1   | Software Interrupt 2 |
| 10    | I2   | Software Interrupt 3 |
| 11    | I3   | Hardware Interrupt 1 |
| 12    | I4   | Hardware Interrupt 2 |
| 13    | I5   | Hardware Interrupt 3 |
| 14    | I6   | Hardware Interrupt 4 | 
| 15    | I7   | Hardware Interrupt 5 |


## Example Assembly / Machine Code
I have not made an assembler yet, but it will probably look something like this.
The commented machine code is what is used in [src/rom.v](src/rom.v) to run instructions.

This example is located in [test/tests.asm](test/tests.asm).
```assembly
; Test cases - Machine code used in src/rom.v
;
;
; Test ALU
ADD R0,R0,R0     ; [000] = 0000000000000000
ADI R1,0x02      ; [002] = 1000000100000010
ADI R2,0x01      ; [004] = 1000001000000001
ADD R3,R2,R1     ; [006] = 0000001100100001
SUB R3,R3,R0     ; [008] = 0001001100110000
AND R2,R2,R3     ; [010] = 0010001000100011
ORR R2,R3,R2     ; [012] = 0011001000110010
NOT R4,R4,R0     ; [014] = 0100010001000000
XOR R4,R4,R4     ; [016] = 0101010001000100
LSR R2,R2,R0     ; [018] = 0110001000100000
LSL R2,R2,R0     ; [020] = 0111001000100000
XOR R1,R1,R1     ; [022] = 0101000100010001
XOR R2,R2,R2     ; [024] = 0101001000100010
XOR R3,R3,R3     ; [026] = 0101001100110011
XOR R4,R4,R4     ; [028] = 0101010001000100
;
; Test SWP
ADI R1,11001100  ; [030] = 1000000111001100
ADI R2,10101010  ; [032] = 1000001010101010
SWP R3,R1,R2     ; [034] = 1001001100010010
XOR R1,R1,R1     ; [036] = 0101000100010001
XOR R2,R2,R2     ; [038] = 0101001000100010
XOR R3,R3,R3     ; [040] = 0101001100110011
;
; Test Memory
ADI R1,0x02      ; [042] = 1000000100000010  (value)
ADI R2,0x08      ; [044] = 1000001000001000  (address)
STW R0,R2,R1     ; [046] = 1011000000100001  (store R1 at address R2)
XOR R1,R1,R1     ; [048] = 0101000100010001
LDW R1,R2,R0     ; [050] = 1010000100100000  (load R1 from address R2)
ADD R0,R1,R0     ; [052] = 0000000000010000
XOR R1,R1,R1     ; [054] = 0101000100010001
XOR R2,R2,R2     ; [056] = 0101001000100010
;
; Test Branch (relative addressing)
ADI R1,0x03      ; [058] = 1000000100000011  (skip next 3 instructions if Z)
BRZ R0,R0,R1     ; [060] = 1100000000000001  (0 - 0 == 0)
ADD R0,R0,R0     ; [062] = 0000000000000000  (will be skipped)
ADD R0,R0,R0     ; [064] = 0000000000000000  (will be skipped)
ADD R0,R0,R0     ; [066] = 0000000000000000  (will be skipped)
ADI R1,0x07      ; [068] = 1000000100000111  (branch lands here)
XOR R1,R1,R1     ; [070] = 0101000100010001
;
; Test Jump (absolute addressing)
ADI R1,0x52      ; [072] = 1000001001010010  (address 082)
JAL R1,R2,R0     ; [074] = 1101000100100000  (link to R1, jump to R2)
ADD R0,R0,R0     ; [076] = 0000000000000000  (will be skipped)
ADD R0,R0,R0     ; [078] = 0000000000000000  (will be skipped)
ADD R0,R0,R0     ; [080] = 0000000000000000  (will be skipped)
ADD R1,R1,R0     ; [082] = 0000000100010000  (jump lands here)
XOR R1,R1,R1     ; [084] = 0101000100010001
XOR R2,R2,R2     ; [086] = 0101001000100010
;
```


## Future Goals
* Assembler
  * probably in C, Python, or Rust
  * pseudo opcodes for missing opcodes like ```PSH```, ```POP```, ```MOV```, ```JMP```, etc.
* Video card interface
* Serial interface
* Keyboard interface
* Very very basic operating system
* Basic programming language with compiler targeted for this CPU


## References
* [Icarus Verilog](http://iverilog.icarus.com/)
* [GTKwave](http://gtkwave.sourceforge.net/)
* [Digital Computer Electronics](https://www.amazon.com/Digital-Computer-Electronics-Albert-Malvino/dp/0028005945)
* [Essentials of Computer Organization and Architecture](https://www.amazon.com/Essentials-Computer-Organization-Architecture-Linda/dp/1284123030)
* [Elements of Computing Systems](https://www.amazon.com/Elements-Computing-Systems-Building-Principles/dp/0262640686)
* [Nand2Tetris Course](https://www.nand2tetris.org/)
