## VHDL-Computer

This will be an attempt of making a basic computer using VHDL.


## Gates (VHDL Introduction)
A short introduction to VHDL by making a "suite" of gates in terms of NAND.

Any Boolean function can be implemented by using a combination of NAND gates. https://en.wikipedia.org/wiki/NAND_gate

In other words, I started with no elementary gates besides NAND and built the other gates out starting with
NOT = ```<signal-A> NAND <signal-A>```. Then since I made a NOT gate I could make AND = ``` NOT(<signal-A>) NAND NOT(<signal-B>)```.

This is to follow the Nand2Tetris HDL section of the course, which suggests trying to do things without "off the shelf" gates. 
Since Nand2Tetris uses a proprietary HDL, I decided it would be more useful to learn a widely used HDL alongside the course and 
attempt to make everything work in VHDL.


## ALU 
| **zx** | **nx** | **zy** | **ny** | **f** | **no** | **out** |
| :----: | :----: | :----: | :----: | :---: | :----: | :-----: |
| 1      | 0      | 1      | 0      | 1     | 0      | 0       |
| 1      | 1      | 1      | 1      | 1     | 1      | 1       |
| 1      | 1      | 1      | 0      | 1     | 0      | -1      |
| 0      | 0      | 1      | 1      | 0     | 0      | x       |
| 1      | 1      | 0      | 0      | 0     | 0      | 0       |
| 0      | 0      | 1      | 1      | 0     | 1      | !x      |
| 1      | 1      | 0      | 0      | 0     | 1      | !y      |
| 0      | 0      | 1      | 1      | 1     | 1      | -x      |
| 1      | 1      | 0      | 0      | 1     | 1      | -y      |
| 0      | 1      | 1      | 1      | 1     | 1      | x+1     |
| 1      | 1      | 0      | 1      | 1     | 1      | y+1     |
| 0      | 0      | 1      | 1      | 1     | 0      | x-1     |
| 1      | 1      | 0      | 0      | 1     | 0      | y-1     |
| 0      | 0      | 0      | 0      | 1     | 0      | x+y     |
| 0      | 1      | 0      | 0      | 1     | 1      | x-y     |
| 0      | 0      | 0      | 1      | 1     | 1      | y-x     |
| 0      | 0      | 0      | 0      | 0     | 0      | x AND y |
| 0      | 1      | 0      | 1      | 0     | 1      | x OR y  |


## Sources:
* VHDL / Verilog Tutorials https://www.nandland.com/
* Nand2Tetris coursera https://www.coursera.org/learn/build-a-computer/home/info
* Vivado Design Suite https://www.xilinx.com/products/design-tools/vivado.html
* Beginner FPGA (Compatible with Vivado) https://store.digilentinc.com/basys-3-artix-7-fpga-trainer-board-recommended-for-introductory-users/
