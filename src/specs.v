/*

A notepad to jot down some specs...this will probably be removed in the future.


16x16-bit registers
* R0     - zero register
* R1-R11 - general purpose
* R12    - scratch register 
* R13    - status register (flags, control, errors)
* R14    - link register
* R15    - stack pointer



ALU Operations:
  000 - ADD
  001 - ASR
  010 - AND
  011 - ORR
  100 - NOT
  101 - XOR
  110 - LSR
  111 - LSL


Status Register:
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



| OPCODE | SYNTAX          | LOGIC                  | DESCRIPTION                                             |
| ------ | --------------- | ---------------------- | ------------------------------------------------------- |
| 0000   | ADD R1,R2,R3    | R1 = R2 + R3           | register addition                                       |
| 0001   | SUB R1,R2,R3    | R1 = R2 - R3           | register subtraction                                    |
| 0010   | AND R1,R2,R3    | R1 = R2 & R3           | logical AND                                             |
| 0011   | ORR R1,R2,R3    | R1 = R2 | R3           | logical OR                                              |
| 0100   | NOT R1,R2,R0    | R1 = ~R2               | logical NOT                                             |
| 0101   | XOR R1,R2,R3    | R1 = R2 ^ R3           | logical XOR                                             |
| 0110   | LSR R1,R2,R0    | R1 = R2 >> 1           | logical shift right                                     |
| 0111   | LSL R1,R2,R0    | R1 = R2 << 1           | logical shift left                                      |
| 1000   | ADI R1,00001111 | R1 += 0000000000001111 | Add immediate to R1                                     |
| 1001   | SWP R1,R2,R3    | R1 = R2[HI] R3[LO]     | Swap bytes of registers                                 |
| 1010   | LDW R1,R2,R0    | R1 = [R2]              | load word into R1 from memory address R2                |
| 1011   | STW R0,R2,R1    | [R2] = R1              | store word in R1 at memory address R2                   |
| 1100   | BRZ R0,R1,R2    | PC = R1-0=Z ? R2 : PC  | relative branch to R2 if result of R1-0 sets zero flag  |
| 1101   | JAL R1,R2       | R1 = PC+2 ; PC = R2    | jump to address R2 and link to R1                       |
| 1110   |                 |                        |                                                         |
| 1111   |                 |                        |                                                         |



IDEA: 
For BRZ Rd could be used to branch on different status flags.
BRZ could be changed to BRI (Branch If), allowing 4 flags and combinations
ex: BRI 0011,R0,R1 -> Branch if carry and zero flags set



Psuedo Opcode Brainstorm:
  1. INC R1,0x01    
    * XOR R12,R12,R12  ; clear scratch register   
    * ADI R12,0x01     ; load scratch register with increment
    * ADD R1,R1,R12    ; increment R0 by R12
  2. DEC R0,0x01
    * XOR R12,R12,R12  ; clear scratch register
    * ADI R12,0x01     ; load scratch register with decrement
    * SUB R0,R0,R12    ; decrement R0 by R12
  3. PSH R0
    * XOR R12,R12,R12  ; clear scratch register
    * ADI R12,0x02     ; load increment value
    * ADD R14,R14,R12  ; increment stack pointer
    * STW R15,R0       ; store R0 in stack memory
  4. POP R1
    * XOR R13,R13,R13  ; clear scratch register
    * LDL R13,0x02     ; load scratch register lower with decrement
    * SUB R15,R15,R13  ; decrement stack pointer
    * LDW R1,R15       ; load register from stack
  5. CMP R1,R2
    * SUB R13,R1,R2    ; sets flags, uses scratch register
  6. CLR R1
    * XOR R1,R1,R1     ; clear register contents
  7. NOP               ; no operation
    * ADD R0,R0,R0     ;
  8. JMP R2            
    * JAL R2,R0        ; link to zero register

*/