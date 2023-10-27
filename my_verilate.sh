#!/bin/bash
# run verilator in docker. Choose version freely.
verilator-docker 4.210 --coverage --trace -f ./input.vc -x-assign fast --exe --cc sim_main.cpp top.v sub.v
cd obj_dir
make -f ./Vtop.mk
