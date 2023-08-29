######################################################################
#
# DESCRIPTION: Verilator CMake Example: Small CMakeLists.txt
#
# This is an example cmake script to build a verilog to systemc project
# using cmake and verilator.
#
# This file ONLY is placed under the Creative Commons Public Domain, for
# any use, without warranty, 2020 by Wilson Snyder.
# SPDX-License-Identifier: CC0-1.0
#
######################################################################

# This example builds the tracing_c example using CMake
# To use it, run the following:

# cd /path/to/verilator/examples/cmake_c
# rm -rf build && mkdir build && cd build
# cmake ..
# cmake --build .

cmake_minimum_required(VERSION 3.12)
cmake_policy(SET CMP0074 NEW)
project(my_sim)

find_package(verilator HINTS $ENV{VERILATOR_ROOT} ${VERILATOR_ROOT})
if (NOT verilator_FOUND)
  message(FATAL_ERROR "Verilator was not found. Either install it, or set the VERILATOR_ROOT environment variable")
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Create a new executable target that will contain all your sources
add_executable(my_sim ./sim_main.cpp)

# Add the Verilated circuit to the target
verilate(my_sim COVERAGE TRACE
  INCLUDE_DIRS "."
  VERILATOR_ARGS -f ./input.vc -x-assign fast
  VERILATOR_ARGS --timing
  SOURCES ./top.v)
