/* specs


16x16-bit registers

* R0-R11 - general purpose
* R12 - scratch register
* R13 - status register
* R14 - stack pointer
* R15 - program counter


Instruction Set
  1.  ADD R0,R1,R2    ; R0 = R1 + R2
  2.  SUB R0,R1,R2    ; R0 = R1 - R2
  3.  AND R0,R1,R2    ; R0 = R1 & R2
  4.  ORR R0,R1,R2    ; R0 = R1 | R2
  5.  NOT R0,R1       ; R0 = ~R1  
  6.  XOR R0,R1,R2    ; R0 = R1 ^ R2
  7.  LSR R0,R1       ; R0 = R1 >> 1
  8.  LSL R0,R1       ; R0 = R1 << 1
  9.  LDI R0,11001100 ; R0 = 11001100 (load byte immediate to register)
  10. LDW R0,R1       ; R0 = RAM[R1]  (load word to register from memory address)
  11. STW R0,R1       ; RAM[R0] = R1  (store word at memory address)
  12. BEQ R0          ; Set PC to value in R0 if Z flag = 0
  13. HLT             ; halt processor


Macro Instructions:
  1. INC R0,0x01       
    * LDI R12,0x01     ; load scratch register with increment
    * ADD R0,R0,R12    ; increment R0 by R12
  2. DEC R0,0x01
    * LDI R12,0x01     ; load scratch register with decrement
    * SUB R0,R0,R12    ; decrement R0 by R12
  3. PSH R0
    * LDI R12,0x02     ; load scratch register with increment
    * ADD R14,R14,R12  ; increment stack pointer
    * STW R14,R0       ; store R0 in stack memory
  4. POP R0
    * LDI R12,0x02     ; load scratch register with decrement
    * SUB R14,R14,R12  ; decrement stack pointer
    * LDW R0,R14       ; load register from stack
  5. CMP R0,R1
    * SUB R12,R0,R1    ; sets flags, uses scratch register
  6. CLR R0
    * XOR R0,R0,R0     ; clear register contents


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
    |LDW | Rd | Rs |     ; Load R0 with 16-bit value stored 
    LDW R0,R4            ;  at 16-bit memory address in R4


  - Loading a word from immediates
    0000 0000 0000 0000
   |LDI | Rd | imm[8]  |
   LDI R1,00001111       ; load 

   
    0000 0000 0000 0000
   |BEQ | R0 | R1 | R2 |

















*/