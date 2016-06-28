%{

/* definitions */
#define EOFNUM 0
#define STRINGCONST 1
#define INTEGERCONST 2
#define CHARCONST 3
#define PLUSNUM 4
#define TIMESNUM 5
#define IFNUM 6
#define THENNUM 7
#define ELSENUM 8
#define EQUALNUM 9
#define IDNUM 10
#define LPARENNUM 11
#define RPARENNUM 12
#define SEMINUM 13
#define COMMANUM 14
#define BEGINNUM 15
#define ENDNUM 16
#define PROGRAMNUM 17
#define ISNUM 18
#define MINUSNUM 19
#define DIVNUM 20
#define VARNUM 21
#define PRINTNUM 22

/* int yylval; */
char string_table[20000];
int string_table_index = 0;
int yyline = 1, yycolumn = 1;
%}

delim   [ \t]
ws      {delim}+
letter [a-zA-Z]
digit  [0-9]
id     {letter}({letter}|{digit})*
number {digit}+

%%
"("	  {yycolumn += yyleng; return (LPARENNUM);}
")"       {yycolumn += yyleng; return (RPARENNUM);}
\n        {yyline++;yycolumn=1;}
print     {yycolumn += yyleng; return (PRINTNUM);}
program     {yycolumn += yyleng; return (PROGRAMNUM);}
is     {yycolumn += yyleng; return (ISNUM);}
begin     {yycolumn += yyleng; return (BEGINNUM);}
end     {yycolumn += yyleng; return (ENDNUM);}
var     {yycolumn += yyleng; return (VARNUM);}
{ws}      {yycolumn += yyleng;}
if        {yycolumn += yyleng;return (IFNUM);}
;         {yycolumn += yyleng; return(SEMINUM);}
,         {yycolumn += yyleng; return(COMMANUM);}
"-"	 {yycolumn += yyleng; return (MINUSNUM);}
div	 {yycolumn += yyleng; return (DIVNUM);}
then      {yycolumn += yyleng;return (THENNUM);}
{id}      {  yycolumn += yyleng;
             yylval.var = string_table + put_string(yytext, yyleng); 
             return (IDNUM);
          }
{number}  {yylval.semantic_value = atoi(yytext); yycolumn += yyleng;return (INTEGERCONST);}
'[^'\n]*    {int c;
           yycolumn += yyleng;
           if (yyleng == 2) {
              yylval.semantic_value = put_string(yytext+1, yyleng-1);
              c=input(); /* read the additional ' */
              if (c != '\'') {
                printf("unenclosed character, line = %d, column = %d\n",
                yyline, yycolumn-yyleng);
                if (c != 0) unput(c);
              } 
              return(CHARCONST);
           } else {
              yylval.semantic_value = put_string(yytext+1, yyleng-1);
              c= input();
              if (c != '\'') {
                printf("unended string, line = %d, column = %d\n",
                yyline, yycolumn-yyleng);
                if (c != 0) unput(c);
              } 
              return(STRINGCONST);
           }
          }
\+         {yycolumn += yyleng;return (PLUSNUM);}
"*"       {yycolumn += yyleng;return (TIMESNUM);}
"="       {yycolumn += yyleng;return(EQUALNUM);}
.         {
           printf("Unknown character %s, line = %d, column = %d\n", 
           yytext, yyline, yycolumn);yycolumn += yyleng;}
%%

#include <stdio.h>
#include <string.h>


int yywrap()
{  if (feof(stdin)) return 1;
   return 0;
}

int put_string(char *str, int len)
{
  char buf[2000];
  strncpy(buf, str, len);
  buf[len] = '\0';
  sprintf(string_table+string_table_index, "%s", buf);
  string_table_index += strlen(buf)+1;
  string_table[string_table_index-1] = '\0';
  return (string_table_index-strlen(buf)-1);
}








