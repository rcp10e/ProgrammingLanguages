%{
#include <string.h>
#include <stdio.h>
#include <iostream>
#include <vector>
#include <string>

using namespace std;
extern int put_string(char *str, int len);

/* definitions */
#define ENDOFFILE (0)
#define CCOMMENT (1)
#define STUFF (2)
#define COLON (3)
#define COMMA (4)
#define DOT (5)
#define LPAREN (6) 
#define RPAREN (7)
#define LT (8)
#define GT (9)
#define EQ (10) 
#define MINUS (11)
#define PLUS (12)
#define TIMES (13)
#define DOTDOT (14) 
#define COLEQ (15)
#define LE (16)
#define GE (17)
#define NE (18) 
#define ID (19)
#define ICONST (20)
#define CCONST (21)
#define SCONST (22) 
#define AND (23)
#define ARRAY (24)
#define BEGINNUM (25)
#define CONST (26) 
#define DIV (27)
#define DOWNTO (28)
#define ELSE (29)
#define ELSIF (30) 
#define END (31)
#define ENDIF (32)
#define ENDLOOP (33)
#define ENDREC (34) 
#define EXIT (35)
#define FOR (36)
#define FORWARD (37)
#define FUNCTION (38) 
#define IF (39)
#define IS (40)
#define LOOP (41)
#define NOT (42) 
#define OF (43)
#define OR (44)
#define PROCEDURE (45)
#define PROGRAM (46) 
#define RECORD (47)
#define REPEAT (48)
#define RETURN (49)
#define THEN (50) 
#define TO (51)
#define TYPE (52)
#define UNTIL (53)
#define VAR (54) 
#define WHILE (55)
#define PRINT (56)
#define SEMI (57)

int yylval;
vector<string> string_table;
int string_table_index = 0;
int yyline = 1, yycolumn = 1;
%}

A		[aA]
B		[bB]
C		[cC]
D		[dD]
E		[eE]
F		[fF]
G		[gG]
H		[hH]
I		[iI]
J		[jJ]
K		[kK]
L		[lL]
M		[mM]
N		[nN]
O		[oO]
P		[pP]
Q		[qQ]
R		[rR]
S		[sS]
T		[tT]
U		[uU]
V		[vV]
W		[wW]
X		[xX]
Y		[yY]
Z		[zZ]


opencom		"(*"
closecom	"*)"
safe		[^*)]+	
safestar1	"*"[^)]
safeslash1	[^*]")"
safeslash2	"("[^*]
safestar2	[^(]"*"

delim   [ \t]
ws      {delim}+
letter [a-zA-Z]
digit  [0-9]
id     {letter}({letter}|{digit})*
number {digit}+
%%

{opencom}({safe}|{safestar1}|{safeslash1}|{safestar2}|{safeslash2})+{closecom}			{yycolumn += yyleng;}
{opencom}({safe}|{safestar1}|{safeslash1}|{safestar2}|{safeslash2})				{cout << "Error: unended comment\n"; yycolumn +=  yyleng;}		
"("									{yycolumn += yyleng; return (LPAREN);}
")"									{yycolumn += yyleng; return (RPAREN);}
"."									{yycolumn += yyleng; return (DOT);}
";"									{yycolumn += yyleng; return (SEMI);}
","									{yycolumn += yyleng; return (COMMA);}
":"									{yycolumn += yyleng; return (COLON);}
\+         								{yycolumn += yyleng;return (PLUS);}
"*"       								{yycolumn += yyleng;return (TIMES);}
"="       								{yycolumn += yyleng;return(EQ);}
"<"									{yycolumn += yyleng; return(LT);}
">"									{yycolumn += yyleng; return(GT);}
"-"									{yycolumn += yyleng; return(MINUS);}
'([^'\n]|\\')*'    							{	int c;
											yycolumn += yyleng;
											if (yyleng == 2) {
											yylval = put_string(yytext+1, yyleng-1);
											c=yyinput(); /* read the additional ' */
											if (c != '\'') {
											cout << 
											"unenclosed character, line = " << yyline << ", column ="
											<<  yycolumn-yyleng << "\n";
												if (c != 0) unput(c);
											} 
											return(CCONST);
											} else {
												yylval = put_string(yytext+1, yyleng-1);
												c= yyinput();
											if (c != '\'') {
											cout << "unended string, line = "  
											<< yyline << ", column = "
											<< yycolumn-yyleng << "\n";
											if (c != 0) unput(c);
											} 
											return(SCONST);
											}
									}
'([^'\n]|\\')*								{yycolumn += yyleng;}
":="									{yycolumn += yyleng; return(COLEQ);}
"<="									{yycolumn += yyleng; return(LE);}
">="									{yycolumn += yyleng; return(GE);}
"<>"									{yycolumn += yyleng; return(NE);}
".."									{yycolumn += yyleng; return(DOTDOT);}
\n       								{yyline++;yycolumn=1;}
{ws}      								{yycolumn += yyleng;}
{I}{F}        								{yycolumn += yyleng;return (IF);}
{T}{H}{E}{N}      							{yycolumn += yyleng;return (THEN);}
{B}{E}{G}{I}{N} 							{yycolumn += yyleng; return (BEGINNUM);}
{E}{N}{D}       							{yycolumn += yyleng; return(END);}
{P}{R}{O}{G}{R}{A}{M} 			  				{yycolumn += yyleng; return(PROGRAM);}
{I}{S}        								{yycolumn += yyleng; return(IS);}
{O}{F}									{yycolumn += yyleng; return(OF);}
{O}{R}									{yycolumn += yyleng; return(OR);}
{N}{O}{T}								{yycolumn += yyleng; return(NOT);}
{A}{N}{D}								{yycolumn += yyleng; return(AND);}
{A}{R}{R}{A}{Y}								{yycolumn += yyleng; return(ARRAY);}
{D}{I}{V}								{yycolumn += yyleng; return(DIV);}
{D}{O}{W}{N}{T}{O}							{yycolumn += yyleng; return(DOWNTO);}
{E}{L}{S}{E}								{yycolumn += yyleng; return(ELSE);}
{E}{L}{S}{I}{F}								{yycolumn += yyleng; return(ELSIF);}
{E}{N}{D}{I}{F}								{yycolumn += yyleng; return(ENDIF);}
{E}{N}{D}{L}{O}{O}{P}							{yycolumn += yyleng; return(ENDLOOP);}
{E}{N}{D}{R}{E}{C}							{yycolumn += yyleng; return(ENDREC);}
{E}{X}{I}{T}								{yycolumn += yyleng; return(EXIT);}
{F}{O}{R}								{yycolumn += yyleng; return(FOR);}
{F}{O}{R}{W}{A}{R}{D}							{yycolumn += yyleng; return(FORWARD);}
{F}{U}{N}{C}{T}{I}{O}{N}						{yycolumn += yyleng; return(FUNCTION);}
{L}{O}{O}{P}								{yycolumn += yyleng; return(LOOP);}
{P}{R}{O}{C}{E}{D}{U}{R}{E}						{yycolumn += yyleng; return(PROCEDURE);}
{R}{E}{C}{O}{R}{D}							{yycolumn += yyleng; return(RECORD);}
{R}{E}{P}{E}{A}{T}							{yycolumn += yyleng; return(REPEAT);}
{R}{E}{T}{U}{R}{N}							{yycolumn += yyleng; return(RETURN);}
{T}{O}									{yycolumn += yyleng; return(TO);}
{T}{Y}{P}{E}								{yycolumn += yyleng; return(TYPE);}
{U}{N}{T}{I}{L}								{yycolumn += yyleng; return(UNTIL);}
{V}{A}{R}								{yycolumn += yyleng; return(VAR);}
{W}{H}{I}{L}{E}								{yycolumn += yyleng; return(WHILE);}
{P}{R}{I}{N}{T}								{yycolumn += yyleng; return (PRINT);}
{C}{O}{N}{S}{T}{A}{N}{T}						{yycolumn += yyleng; return (CONST);}
{id}      								{  yycolumn += yyleng;
											yylval = put_string(yytext, yyleng); 
											return (ID);
										}
{number}  								{yylval = atoi(yytext); yycolumn += yyleng;return (ICONST);}
.         								{
											printf("Unknown character %s, line = %d, column = %d\n", 
											yytext, yyline, yycolumn);yycolumn += yyleng;}

%%

int yywrap()
{  if (feof(stdin)) return 1;
   return 0;
}

int put_string(char *str, int len)
{
  string s(str);
  string_table.push_back(s);
  string_table_index++;
  return string_table_index-1; 
} 




