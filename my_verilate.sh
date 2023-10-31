#!/bin/bash
# run verilator in docker. Choose version freely.

verilator-docker 4.210 --Wno-UNOPT --Wno-COMBDLY --Wno-CASEX --Wno-CASEINCOMPLETE --Wno-STMTDLY --Wno-WIDTHCONCAT --Wno-INFINITELOOP --Wno-PINMISSING --Wno-IMPLICIT --coverage --trace -f ./input.vc -x-assign fast --exe --cc sim_main.cpp \
       		 top.v\
		 clkrst.v\
		 data_gen.v\
		 pcm.v\
		 hamming.v\
		 framer.v\
		 fsk.v\
		 r_fsk.v\
		 r_framer.v\
		 r_hamming.v\
		 r_pcm.v
cd obj_dir
# make -f ./Vtop.mk
