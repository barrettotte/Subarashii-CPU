# Development Environment

Ubuntu, VS Code, Icarus Verilog, and GTKWave


## Dependencies
* ```sudo apt-get install iverilog gtkwave```
* VS Code - [Verilog HDL/SystemVerilog](https://github.com/mshr-h/vscode-verilog-hdl-support)


## Commands
* compile - ```iverilog -o out/simple.vvp test/simple_tb.v```
* run simulation - ```vvp out/simple.vvp```
* view in graph - ```gtkwave out/simple.vcd```


## References
* https://github.com/albertxie/iverilog-tutorial
