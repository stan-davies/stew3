CC = gcc

FILES = main.c tsta.s st_lsop.s st_p.s st_proc.s

TESTS = tests/test1.s tests/test2.s tests/test3.s tests/test4.s

OUT = -o a

all : compile
compile:
	@${CC} ${FILES} ${TESTS} ${OUT}
