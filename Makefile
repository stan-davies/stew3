CC = gcc

MAINF = main.c tsta.s 

STEWF = algor/st_lsop.s algor/st_p.s algor/st_proc.s

TESTF = tests/test1.s tests/test2.s tests/test3.s tests/test4.s

OUT = -o a

all : compile
compile:
	@${CC} ${MAINF} ${STEWF} ${TESTF} ${OUT}
