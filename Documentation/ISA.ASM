;  +---------------------------------------------------------+
;  |  FILE:  ISA.ASM                                         |
;  |  DESC:  THE SUBARASHII INSTRUCTION SET                  |
;  |  DATE:  02-19-2019                                      |
;  +---------------------------------------------------------+
;
;  +--------+-------------+     +------+---------------+
;  | LETTER | DESCRIPTION |     | FLAG | DESCRIPTION   |
;  +--------+-------------+     +------+---------------+
;  | X      | UNASSIGNED  |     | C    | CARRY FLAG    |
;  | D      | DESTINATION |     | Z    | ZERO FLAG     |
;  | S      | SOURCE      |     | V    | OVERFLOW FLAG |
;  | N      | NUMBER      |     | N    | NEGATIVE FLAG |
;  +--------+-------------+     +------+---------------+
;
;
;  +-----------------------------------------------------------------------------------------+
;  |                               SUBARASHII INSTRUCTION SET                                |
;  +-------+----------+--------------------------------+-------------+---------+-------------+
;  | INDEX | MNEMONIC | DESCRIPTION                    | SYNTAX      | OP CODE | PARAMETERS  |
;  +-------+----------+--------------------------------+-------------+---------+-------------+
;  | 00    | JMP      | JUMP TO LINE                   | JMP N       |   00000 | XXXNNNNNNNN |
;  | 01    | BRC      | BRANCH IF CARRY                | BRC N       |   00001 | XXXNNNNNNNN |
;  | 02    | BRZ      | BRANCH IF ZERO                 | BRZ N       |   00010 | XXXNNNNNNNN |
;  | 03    | BRV      | BRANCH IF OVERFLOW             | BRV N       |   00011 | XXXNNNNNNNN |
;  | 04    | BRN      | BRANCH IF NEGATIVE             | BRN N       |   00100 | XXXNNNNNNNN |
;  | 05    | JTS      | JUMP TO SUBROUTINE             | JTS N       |   00101 | XXXNNNNNNNN |
;  | 06    | RET      | RETURN FROM SUBROUTINE         | RET         |   00110 | XXXXXXXXXXX |
;  | 07    | ---      | ---                            | ---         |   00111 | ----------- |
;  | 08    | ADDI     | ADD IMMEDIATE TO RD            | ADDI RD,N   |   01000 | DDDNNNNNNNN |
;  | 09    | SUBI     | SUBTRACT IMMEDIATE FROM RD     | SUBI RD,N   |   01001 | DDDNNNNNNNN |
;  | 10    | ANDI     | LOGICAL AND RD WITH IMMEDIATE  | ANDI RD,N   |   01010 | DDDNNNNNNNN |
;  | 11    | ORI      | LOGICAL OR RD WITH IMMEDIATE   | ORI  RD,N   |   01011 | DDDNNNNNNNN |
;  | 12    | LDI      | LOAD IMMEDIATE TO RD           | LDI RD,N    |   01100 | DDDNNNNNNNN |
;  | 13    | LDD      | DIRECT LOAD FROM DATA MEMORY   | LDD RD,[N]  |   01101 | DDDNNNNNNNN |
;  | 14    | SDD      | DIRECT STORE TO DATA MEMORY    | SDD [N],RD  |   01110 | DDDNNNNNNNN |
;  | 15    | NOT      | LOGICAL NOT RD                 | NOT RD      |   01111 | DDDXXXXXXXX |
;  | 16    | ADD      | ADD RS TO RD                   | ADD RD,RS   |   10000 | DDDSSSXXXXX |
;  | 17    | SUB      | SUBTRACT RS FROM RD            | SUB RD,RS   |   10001 | DDDSSSXXXXX |
;  | 18    | AND      | LOGICAL AND RD WITH RS         | AND RD,RS   |   10010 | DDDSSSXXXXX |
;  | 19    | OR       | LOGICAL OR RD WITH RS          | OR  RD,RS   |   10011 | DDDSSSXXXXX |
;  | 20    | LID      | INDIRECT LOAD FROM DATA MEMORY | LID RD,[RS] |   10100 | DDDSSSXXXXX |
;  | 21    | SID      | INDIRECT STORE TO DATA MEMORY  | SID [RD],RS |   10101 | DDDSSSXXXXX |
;  | 22    | PUSH     | PUSH DATA TO STACK             | PUSH RS     |   10110 | SSSXXXXXXXX |
;  | 23    | POP      | POP DATA FROM STACK            | POP RD      |   10111 | DDDXXXXXXXX |
;  | 24    | ---      | ---                            | ---         |   11000 | ----------- |
;  | 25    | SHL      | SHIFT REGISTER LEFT            | SHL RD      |   11001 | DDDXXXXXXXX |
;  | 26    | SHR      | SHIFT REGISTER RIGHT           | SHR RD      |   11010 | DDDXXXXXXXX |
;  | 27    | SWAP     | SWAP NIBBLES OF RD             | SWAP RD     |   11011 | DDDXXXXXXXX |
;  | 28    | ---      | ---                            | ---         |   11100 | ----------- |
;  | 29    | ---      | ---                            | ---         |   11101 | ----------- |
;  | 30    | ---      | ---                            | ---         |   11110 | ----------- |
;  | 31    | HLT      | HALT PROCESSOR                 | HLT         |   11111 | XXXXXXXXXXX |
;  +-------+----------+--------------------------------+-------------+---------+-------------+