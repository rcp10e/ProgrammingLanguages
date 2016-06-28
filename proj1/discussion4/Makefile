.SECONDARY :

LEX=flex
CC=gcc

all : lexer

%.c : %.l
	$(LEX) -o$*.c $*.l

%.o : %.c
	$(CC) $(CFLAGS) $*.c -c -o $*.o

lexer : lexer.o
	$(CC) $(CFLAGS) lexer.o -lfl -o lexer

clean :
	rm -rf *lexer.[co]

cleaner : clean
	rm -rf lexer?
