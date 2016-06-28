
/* this file define all teh integer values corresponse with 
 * each type of token.
 */
%{
#include <stdio.h>
FILE *treelst;

#include "proj2.c"
extern int yyline;
%}

%union {
    int semantic_value;
    tree tptr;
  }

%token <semantic_value>  EOFnumber             0
%token <semantic_value>  SEMInumber            101
%token <semantic_value>  COLONnumber           102
%token <semantic_value>  COMMAnumber           103
%token <semantic_value>  DOTnumber             104
%token <semantic_value>  LPARENnumber          105
%token <semantic_value>  RPARENnumber          106
%token <semantic_value>  LTnumber              107
%token <semantic_value>  GTnumber              108
%token <semantic_value>  EQnumber              109
%token <semantic_value>  MINUSnumber           110
%token <semantic_value>  PLUSnumber            111
%token <semantic_value>  TIMESnumber           112
%token <semantic_value>  DOTDOTnumber          113
%token <semantic_value>  COLEQnumber           114
%token <semantic_value>  LEnumber              115
%token <semantic_value>  GEnumber              116
%token <semantic_value>  NEnumber              117
%token <semantic_value>  IDnumber              118
%token <semantic_value>  ICONSTnumber          119
%token <semantic_value>  CCONSTnumber          120
%token <semantic_value>  SCONSTnumber          121
%token <semantic_value>  ANDnumber             122
%token <semantic_value>  ARRAYnumber           123
%token <semantic_value>  BEGINnumber           124
%token <semantic_value>  CONSTnumber           125
%token <semantic_value>  DIVIDEnumber          126
%token <semantic_value>  DOWNTOnumber          127
%token <semantic_value>  ELSEnumber            128
%token <semantic_value>  ELSIFnumber           129
%token <semantic_value>  ENDnumber             130
%token <semantic_value>  ENDIFnumber           131
%token <semantic_value>  ENDLOOPnumber         132
%token <semantic_value>  ENDRECnumber          133
%token <semantic_value>  EXITnumber            134
%token <semantic_value>  FORnumber             135
%token <semantic_value>  FORWARDnumber         136
%token <semantic_value>  FUNCTIONnumber        137
%token <semantic_value>  IFnumber              138
%token <semantic_value>  ISnumber              139
%token <semantic_value>  LOOPnumber            140
%token <semantic_value>  NOTnumber             141
%token <semantic_value>  OFnumber              142
%token <semantic_value>  ORnumber              143
%token <semantic_value>  PROCEDUREnumber       144
%token <semantic_value>  PROGRAMnumber         145
%token <semantic_value>  RECORDnumber          146
%token <semantic_value>  REPEATnumber          147
%token <semantic_value>  RETURNnumber          148
%token <semantic_value>  THENnumber            149
%token <semantic_value>  TOnumber              150
%token <semantic_value>  TYPEnumber            151
%token <semantic_value>  UNTILnumber           152
%token <semantic_value>  VARnumber             153
%token <semantic_value>  WHILEnumber           154


%type <tptr> program
%type <tptr> exp

%left PLUSnumber, MINUSnumber
%left TIMESnumber, DIVIDEnumber

%%   /* specification */

program : exp {Root = $1;}
        ;
exp : exp PLUSnumber exp
{$$ = MakeTree(AddOp, $1, $3);}
    | exp MINUSnumber exp
{$$ = MakeTree(SubOp, $1, $3);}
    | exp TIMESnumber exp
{$$ = MakeTree(MultOp, $1, $3);}
    | exp DIVIDEnumber exp
{$$ = MakeTree(DivOp, $1, $3);}
    | LPARENnumber exp RPARENnumber
{$$ = $2;}
    | ICONSTnumber
{ $$ = MakeLeaf(NUMNode, $1); }
    | IDnumber
{ $$ = MakeTree(VarOp, MakeLeaf(IDNode, $1), NullExp()); }
    ;
%%

yyerror(str)
char *str;
{    printf("yyerror: %s at line %d\n", str, yyline);
/* ErrorTag = 1; */
   }

#include "lex.yy.c"

main()
{
  /*
  if ((treelst = fopen("printtree.out", "w")) == NULL) {
    printf("Cannot open file printtree.out\n");
    exit(0);
  }
  */

  treelst = stderr; /* just print it to standard error */

  if (!yyparse()) {
    /* checktree(Root); */
    /* checktree always checks the whole program */
    /* we only have an expression here */
    if (ValidExp(Root))
      printtree(Root, 0);
    else {printf("invalid expression\n"); exit(0);}
  } else printf("reject\n");
}    









