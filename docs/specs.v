/*


16x16-bit registers
  * R0     - zero register
  * R1-R11 - general purpose
  * R12    - link register
  * R13    - scratch register
  * R14    - status register (flags, control, errors)
  * R15    - stack pointer



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
| 3     | P      | Parity           | Even=1, Odd=0                     |
| 4     | V      | Overflow         | Result of operation was too large |
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



| OPCODE | SYNTAX          | LOGIC                  | DESCRIPTION                            |
| ------ | --------------- | ---------------------- | -------------------------------------- |
| 0000   | ADD R1,R2,R3    | R1 = R2 + R3           | register addition                      |
| 0001   | SUB R1,R2,R3    | R1 = R2 - R3           | register subtraction                   |
| 0010   | AND R1,R2,R3    | R1 = R2 & R3           | logical AND                            |
| 0011   | ORR R1,R2,R3    | R1 = R2 | R3           | logical OR                             |
| 0100   | NOT R1,R2       | R1 = ~R2               | logical NOT                            |
| 0101   | XOR R1,R2,R3    | R1 = R2 ^ R3           | logical XOR                            |
| 0110   | LSR R1,R2       | R1 = R2 >> 1           | logical shift right                    |
| 0111   | LSL R1,R2       | R1 = R2 << 1           | logical shift left                     |
| 1000   | LLI R1,00001111 | R1 = ????????00001111  | load lower immediate                   |
| 1001   | LUI R1,00001111 | R1 = 00001111????????  | load upper immediate                   |
| 1010   | LDW R1,R2,R3    | R1 = [R2+R3]           | load word from memory address+offset   |
| 1011   | STW R1,R2,R3    | [R1+R2] = R3           | store word at memory address+offset    |
| 1100   | BRZ R1          | PC = Z ? R1 : PC       | branch if zero flag set                |
| 1101   | JMP R1          | PC = R1                | jump to address in R1                  |
| 1110   | JAL R1,R2       | R2 = PC+1 ; R1 = PC    | jump to R1 and link R2                 |
| 1111   |                 |                        |                                        |



Psuedo Opcodes:
  1. INC R1,0x01    
    * XOR R13,R13,R13  ; clear scratch register   
    * LLI R13,0x01     ; load scratch register with increment
    * ADD R1,R1,R13    ; increment R0 by R13
  2. DEC R0,0x01
    * XOR R13,R13,R13  ; clear scratch register
    * LLI R13,0x01     ; load scratch register with decrement
    * SUB R0,R0,R13    ; decrement R0 by R13
  3. PSH R0
    * XOR R13,R13,R13  ; clear scratch register
    * LLI R13,0x02     ; load scratch register lower with increment
    * ADD R14,R14,R13  ; increment stack pointer
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
    * LSL R0,R0        ;


*/