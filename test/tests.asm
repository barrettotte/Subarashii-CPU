; Test cases - Written as machine code in rom.v
;
;
; Test ALU
ADD R0,R0,R0     ; 0000000000000000
ADI R1,0x02      ; 1000000100000010
ADI R2,0x01      ; 1000001000000001
ADD R3,R2,R1     ; 0000001100100001
SUB R3,R3,R0     ; 0001001100110000
AND R2,R2,R3     ; 0010001000100011
ORR R2,R3,R2     ; 0011001000110010
NOT R4,R4,R0     ; 0100010001000000
XOR R4,R4,R4     ; 0101010001000100
LSR R2,R2,R0     ; 0110001000100000
LSL R2,R2,R0     ; 0111001000100000
XOR R1,R1,R1     ; 0101000100010001
XOR R2,R2,R2     ; 0101001000100010
XOR R3,R3,R3     ; 0101001100110011
XOR R4,R4,R4     ; 0101010001000100
;
; Test SWP
ADI R1,11001100  ; 1000000111001100
ADI R2,10101010  ; 1000001010101010
SWP R3,R1,R2     ; 1001001100010010
XOR R1,R1,R1     ; 0101000100010001
XOR R2,R2,R2     ; 0101001000100010
XOR R3,R3,R3     ; 0101001100110011
;
; Test Memory
ADI R1,0x02      ; 1000000100000010  (value)
ADI R2,0x08      ; 1000001000001000  (address)
STW R0,R2,R1     ; 1011000000100001
XOR R1,R1,R1     ; 0101000100010001
LDW R1,R2,R0     ; 1010000100100000
ADD R0,R1,R0     ; 0000000000010000
XOR R1,R1,R1     ; 0101000100010001
XOR R2,R2,R2     ; 0101001000100010
;
; Test Branch
ADI R1,0x03      ; 1000000100000011  (skip next 3 instructions if Z)
BRZ R0,R0,R1     ; 1100000000000001  (0 - 0 == 0)
ADD R0,R0,R0     ; 0000000000000000  (skip)
ADD R0,R0,R0     ; 0000000000000000  (skip)
ADD R0,R0,R0     ; 0000000000000000  (skip)
ADI R1,0x07      ; 1000000100000111
XOR R1,R1,R1     ; 0101000100010001
;
;
; Test Jump