all: ex1 ex2
ex2: ex2.l main.cpp
	lex ex2.l
	g++ -o ex2 main.cpp lex.yy.c -lfl
ex1: ex1.l main.cpp
	lex ex1.l
	g++ -o ex1 main.cpp lex.yy.c
clean:
	rm -f *~
	rm -f #*#
	rm -f lex.yy.c
	rm -f a.out
	rm -f ex1
	rm -f ex2
	rm -f core*
	rm -f *.o
