%{
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
#define BEGINnumber (25)
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
%}

openc		"(*"
closec		"*)"
safe		[^*(]+
safestar1	"*"[^(]
safeslash1	[^*]"("

safeslash2	"("[^*]
safestar2	[^(]"*"[^(]"*"
digit		[0-9]
letter		[a-zA-Z]
singlequote	"'"
doublequote	"""
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
space		" "
%%

[openc][safe|safestar1|safeslash1|safestar2|safeslash2]+][closec]			return ;

":"											return COLON;
"," 											return COMMA;
"." 											return DOT;
"("											return LPAREN;
")" 											return RPAREN;
"<" 											return LT;
">" 											return GT;
"=" 											return EQ;
"-" 											return MINUS;
"+" 											return PLUS;
"*" 											return TIMES;
".." 											return DOTDOT;
":=" 											return COLEQ;
"<=" 											return LE;
">=" 											return GE;
"<>" 											return NE;
[0-9]+											return ICONST;
[singlequote][letter][singlequote]							return CCONST;
[doublequote](letter|digit)*[doublequote]						return SCONST;
[letter](letter|digit)*									return ID;		
"AND"	 										return AND;
"ARRAY" 										return ARRAY;
"BEGIN" 										return BEGINnumber;
"CONSTANT" 										return CONST;
"DIV" 											return DIV;
"DOWNTO" 										return DOWNTO;
"ELSE" 											return ELSE;
"ELSIF" 										return ELSIF;
"END" 											return END;
"ENDIF" 										return ENDIF;
"ENDLOOP" 										return ENDLOOP;
"ENDREC" 										return ENDREC;
"EXIT" 											return EXIT;
"FOR" 											return FOR;
"FORWARD" 										return FORWARD;
"FUNCTION"		 								return FUNCTION;
"IF" 											return IF;
"IS" 											return IS;
"LOOP" 											return LOOP;
"NOT" 											return NOT;
"OF" 											return OF;
"OR" 											return OR;
"PROCEDURE" 										return PROCEDURE;
"PROGRAM" 										return PROGRAM;
"RECORD" 										return RECORD;
"REPEAT" 										return REPEAT;
"RETURN" 										return RETURN;
"THEN" 											return THEN;
"TO" 											return TO;
"TYPE" 											return TYPE;
"UNTIL" 										return UNTIL;
"VAR" 											return VAR;
"WHILE" 										return WHILE;
"PRINT" 										return PRINT;
<<EOF>>											return ENDOFFILE;											
%%

int main ()
{
  int retval;

  yyin = stdin;

  while ((retval = yylex ()) != ENDOFFILE)
    if (retval == CCOMMENT)
      {
	fprintf(stdout, "%s\n", yytext);
	fprintf(stdout, "\t------------\t\n");
      }
  fprintf(stdout, "\n");
}
