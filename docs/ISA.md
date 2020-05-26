# Subarashii Instruction Set

16-bit


## Instructions
1.  ADD
2.  AND
3.  OR
4.  XOR
5.  LSR - logical shift right
6.  LSL - logical shift left
7.  LDI - load immediate to register
8.  LDW - load word directly to register from memory address
9.  STW - store word directly from register to memory address
10. LID - load value indirectly to register from memory address
11. SID - store value indirectly from register to memory address
12. BEQ - branch if zero
13. JMP - jump to line
14. HLT - halt processor
15. CMP - compare registers, set flags


## ASM
Instructions that can be added in assembler

* PSH - push to stack,   
* POP - pop from stack
* RET - return from subroutine
* JSR - jump to subroutine
* INC - ADD 1 to REG
* DEC - SUB 1 from REG
* BRC - branch if carry
* BRV - branch if overflow
* BRN - branch if negative
* ASR - arithmetic shift right
* NOT - logical not
* NAND
* NOR 
* XNOR 
* SUB
