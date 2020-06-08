#!/bin/bash
#
# Very basic script to synthesize a module/testbench and open in gtkwave

if [ $# -eq 0 ] ; then
  echo 'No arguments passed. Expected module name'
  exit 1
fi

rm -rf out/*
iverilog "test/$1_tb.v" -I src/ -o "out/$1.vvp"
vvp "out/$1.vvp"
gtkwave "out/$1.vcd"
