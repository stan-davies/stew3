CC = gcc

FILES = main.s st_lsop.s st_p.s

OUT = -o a

all : compile
compile:
	@${CC} ${FILES} ${OUT}
