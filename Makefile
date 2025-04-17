CC = gcc

FILES = main2.s st_lsop.s st_p.s st_proc.s

OUT = -o a

all : compile
compile:
	@${CC} ${FILES} ${OUT}
