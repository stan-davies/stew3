CC = gcc

FILES = main3.s st_lsop.s st_p.s st_proc_test.s

OUT = -o a

all : compile
compile:
	@${CC} ${FILES} ${OUT}
