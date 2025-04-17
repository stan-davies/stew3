CC = gcc

FILES = main.s st_lsop3.s st_p.s

OUT = -o a

all : compile
compile:
	@${CC} ${FILES} ${OUT}
