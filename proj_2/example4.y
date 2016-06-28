
/* this file define all teh integer values corresponse with 
 * each type of token.
 */

/* a simple calculator */

%union {
  int semantic_value;
}

%token   EOFnumber             0
%token   STRINGCONST           1
%token   <semantic_value> INTEGERCONST          2
%token   CHARCONST             3
%token   PLUSNUM               4
%token   TIMESNUM              5
%token   IFNUM                 6
%token   THENNUM               7
%token   ELSENUM               8
%token   EQUALNUM              9
%token   IDNUM                 10
%token   LPARENNUM             11
%token   RPARENNUM             12


%type <semantic_value> exp
%type <semantic_value> term
%type <semantic_value> item

%%   /* specification */

program : exp {printf("\nresult = %d\n", $1);}
        ;
exp : exp PLUSNUM term
{
  $$ = $1 + $3;
}
    | term
{
  $$ = $1;
}
    ;
term : term TIMESNUM item
{$$ = $1 * $3;}
     | item
{$$ = $1;}
     ;
item : LPARENNUM exp RPARENNUM
{$$ = $2;}
    | INTEGERCONST
{$$ = $1;}
    ;
%%


#include "lex.yy.c"
#include <stdio.h>


yyerror(str)
char *str;
{    printf("yyerror: %s at line %d\n", str, yyline);
}


main()
{
  if (!yyparse()) {printf("accept\n");}
  else printf("reject\n");
}    









