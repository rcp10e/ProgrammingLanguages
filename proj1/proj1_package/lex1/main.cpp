#include <stdio.h>
//extern int yylval;
//extern char string_table[20000];
extern int yylex();

main()
{
  int i;
  while (yylex());
}
