example0: 
	lex lexer.l
	yacc -v example0.y
	gcc -o example0 y.tab.c -ll
example1:
	lex lexer.l
	yacc -v example1.y
	gcc -o example1 y.tab.c -ll
example3:
	lex lexer.l
	yacc -v example3.y
	gcc -o example3 y.tab.c -ll
example4:
	lex lexer.l
	yacc -v example4.y
	gcc -o example4 y.tab.c -ll
clean:
	rm -f y.tab.c
	rm -f lex.yy.c
	rm -f example0
	rm -f example1
	rm -f example3
	rm -f example4
	rm -f y.output
	rm -f *~
