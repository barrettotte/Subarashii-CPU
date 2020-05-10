;  +---------------------------------------------------------+
;  |  FILE:  ADD.ASM                                         |
;  |  DESC:  A SIMPLE EXAMPLE OF ADD INSTRUCTION USING THE   |
;  |           SUBARASHII INSTRUCTION SET.                   |
;  |  DATE:  02-19-2019                                      |
;  +---------------------------------------------------------+
;
;
; TBD DIRECTIVE AND/OR SECTION DECLARATION
;
;
;                   ;  +----------------------+
;                   ;  |    [MACHINE CODE]    |
;                   ;  +-------+--------------+
;                   ;  |  OP   |  PARAMETERS  |
;                   ;  +-------+--------------+
LDI A,00001111      ;  | 01100 | 00000001111  |
LDI B,11110000      ;  | 01100 | 00111110000  |
ADD A,B             ;  | 10000 | 000001XXXXX  |
HLT                 ;  | 11111 | XXXXXXXXXXX  |
;                   ;  |       |              |
;                   ;  +-------+--------------+
;
;
;  +------------------------+
;  |    [REGISTER BANK]     |
;  +-----+-----+------------+
;  | 000 |  A  |  11111111  |
;  | 001 |  B  |  11110000  |
;  | 010 |  C  |  XXXXXXXX  |
;  | 011 |  D  |  XXXXXXXX  |
;  | 100 |  E  |  XXXXXXXX  |
;  | 101 |  F  |  XXXXXXXX  |
;  | 110 |  G  |  XXXXXXXX  |
;  | 111 |  H  |  XXXXXXXX  |
;  +-----+-----+------------+