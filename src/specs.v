/*


16x16-bit registers
  * R0     - zero register
  * R1-R11 - general purpose
  * R12    - scratch register
  * R13    - status register (flags, control, errors)
  * R14    - stack pointer
  * R15    - program counter



ALU Operations:
  000 - ADD
  001 - SUB
  010 - AND
  011 - ORR
  100 - NOT
  101 - XOR
  110 - LSR
  111 - LSL


Status Register:
| Index | Symbol | Name             | Description                       |
| ----- | ------ | ---------------- | --------------------------------- |
| 0     | Z      | Zero             | Result of operation was zero      |
| 1     | C      | Carry            |                                   |
| 2     | N      | Negative         | Result of operation was negative  |
| 3     | V      | Overflow         | Result of operation was too large |
| 4     | P      | Parity           | Even=1, Odd=0                     |
| 5     | D      | Decimal          | Flag useful for BCD               |
| 6     | I      | Interrupt Enable |                                   |
| 7     |        |                  |                                   |
| 8     |        |                  |                                   |
| 9     |        |                  |                                   |
| 10    |        |                  |                                   |
| 11    |        |                  |                                   |
| 12    |        |                  |                                   |
| 13    |        |                  |                                   |
| 14    |        |                  |                                   |
| 15    |        |                  |                                   |



| OPCODE | SYNTAX          | LOGIC                 | DESCRIPTION                            |
| ------ | --------------- | --------------------- | -------------------------------------- |
| 0000   | ADD R0,R1,R2    | R0 = R1 + R2          | register addition                      |
| 0001   | SUB R0,R1,R2    | R0 = R1 - R2          | register subtraction                   |
| 0010   | AND R0,R1,R2    | R0 = R1 & R2          | logical AND                            |
| 0011   | ORR R0,R1,R2    | R0 = R1 | R2          | logical OR                             |
| 0100   | NOT R0,R1       | R0 = ~R1              | logical NOT                            |
| 0101   | XOR R0,R1,R2    | R0 = R1 ^ R2          | logical XOR                            |
| 0110   | LSR R0,R1       | R0 = R1 >> 1          | logical shift right                    |
| 0111   | LSL R0,R1       | R0 = R1 << 1          | logical shift left                     |
| 1000   | LDL R0,00001111 | R0 = ????????00001111 | load immediate lower                   |
| 1001   | LDU R0,00001111 | R0 = 00001111???????? | load immediate upper                   |
| 1010   | LDW R0,R1,R2    | R0 = [R1+R2]          | load word from memory address + offset |
| 1011   | STW R0,R1,R2    | [R0+R2] = R1          | store word at memory address + offset  |
| 1100   | BEQ R0          | PC = Z ? R0 : PC      | branch if equal                        |
| 1101   |
| 1110   |
| 1111   |




Macro Instructions:
  1. INC R1,0x01       
    * LDI R12,0x01     ; load scratch register with increment
    * ADD R1,R1,R12    ; increment R0 by R12
  2. DEC R0,0x01
    * LDI R12,0x01     ; load scratch register with decrement
    * SUB R0,R0,R12    ; decrement R0 by R12
  3. PSH R0
    * XOR R12,R12,R12  ; clear scratch register
    * LDL R12,0x02     ; load scratch register lower with increment
    * ADD R14,R14,R12  ; increment stack pointer
    * STW R14,R0       ; store R0 in stack memory
  4. POP R1
    * XOR R12,R12,R12  ; clear scratch register
    * LDL R12,0x02     ; load scratch register lower with decrement
    * SUB R14,R14,R12  ; decrement stack pointer
    * LDW R1,R14       ; load register from stack
  5. CMP R1,R2
    * SUB R12,R1,R2    ; sets flags, uses scratch register
  6. CLR R1
    * XOR R1,R1,R1     ; clear register contents
  7. NOP               ; no operation
    * ADD R0,R0,R0     ;


Instruction Notes
  
  - Adding two registers
     0000 0000 0000 0000
    |ADD | Rd | Rx | Ry |
    ADD R2,R0,R1         ; Add R0 and R1, store in R2


  - Loading an immediate
     0000 0000 0000 0000
    |LDI | Rd | imm[8]  |
    LDI R0,00001111      ; Load 8-bit immediate into R0


  - Loading a word from register
     0000 0000 0000 0000
    |LDW | Rd | Rs | offset  ; Load R0 with 16-bit value stored 
    LDW R0,R4                ;  at 16-bit memory address in R4


  - Loading a word from immediates
    0000 0000 0000 0000
   |LDI | Rd | imm[8]  |
   LDI R1,00001111       ; load 

   
    0000 0000 0000 0000
   |BEQ | R0 | R1 | R2 |



*/