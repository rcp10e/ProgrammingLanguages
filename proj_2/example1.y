
/* this file define all teh integer values corresponse with 
 * each type of token.
 */

%union {
  int semantic_value;
}


%token   EOFnumber             0
%token   STRINGCONST           1
%token   INTEGERCONST          2
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

%%   /* specification */

exp : exp PLUSNUM exp
    | exp TIMESNUM exp
    | LPARENNUM exp RPARENNUM
    | INTEGERCONST
    | IDNUM
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









