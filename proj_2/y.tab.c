#ifndef lint
static char const 
yyrcsid[] = "$FreeBSD: src/usr.bin/yacc/skeleton.c,v 1.28 2000/01/17 02:04:06 bde Exp $";
#endif
#include <stdlib.h>
#define YYBYACC 1
#define YYMAJOR 1
#define YYMINOR 9
#define YYLEX yylex()
#define YYEMPTY -1
#define yyclearin (yychar=(YYEMPTY))
#define yyerrok (yyerrflag=0)
#define YYRECOVERING() (yyerrflag!=0)
static int yygrowstack();
#define YYPREFIX "yy"
#line 6 "example0.y"
typedef union {
  int semantic_value;
  char * var;
} YYSTYPE;
#line 22 "y.tab.c"
#define YYERRCODE 256
#define EOFnumber 0
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
const short yylhs[] = {                                        -1,
    0,    4,    6,    6,    5,    7,    7,    8,    8,    1,
    1,    1,    1,    2,    2,    2,    3,    3,    3,
};
const short yylen[] = {                                         2,
    5,    2,    3,    1,    2,    3,    2,    3,    2,    3,
    3,    1,    2,    3,    3,    1,    1,    1,    3,
};
const short yydefred[] = {                                      0,
    0,    0,    0,    0,    0,    0,    0,    2,    0,    1,
    0,    0,    0,    5,    0,    3,    0,   17,   18,    0,
    0,    0,    0,   16,    0,    7,    0,    0,    0,    0,
    0,    0,    0,    6,   19,    0,    0,   14,   15,
};
const short yydgoto[] = {                                       2,
   22,   23,   24,    6,   10,    8,   14,   15,
};
const short yysindex[] = {                                     -7,
   10,    0,    6,    5,   20,   25,   35,    0,   -8,    0,
   20,   45,   -2,    0,   -9,    0,   -2,    0,    0,   -2,
   41,   -3,   24,    0,   -8,    0,   -3,   15,   24,   41,
   41,   41,   41,    0,    0,   24,   24,    0,    0,
};
const short yyrindex[] = {                                      0,
    0,    0,    0,    0,    0,    0,   42,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,   23,   -1,    0,    0,    0,   37,    0,    9,    0,
    0,    0,    0,    0,    0,   19,   29,    0,    0,
};
const short yygindex[] = {                                      0,
   38,   16,  -27,    0,    0,   48,   31,    0,
};
#define YYTABLESIZE 59
const short yytable[] = {                                      18,
   30,   12,   12,   25,   38,   39,   26,   19,   20,    1,
   12,   12,   13,   13,   12,   31,   21,   12,   30,    3,
   13,   13,   10,    4,   13,    5,   35,   13,   32,    7,
   10,   10,   11,   31,   10,    9,   29,   10,    9,    9,
   11,   11,   18,   33,   11,   36,   37,   11,   11,    8,
   19,   20,    8,   17,   27,   34,    4,   28,   16,
};
const short yycheck[] = {                                       2,
    4,   10,    4,   13,   32,   33,   16,   10,   11,   17,
   12,   13,    4,   22,   16,   19,   19,   19,    4,   10,
   12,   13,    4,   18,   16,   21,   12,   19,    5,   10,
   12,   13,    4,   19,   16,   13,   21,   19,   16,   15,
   12,   13,    2,   20,   16,   30,   31,   19,   14,   13,
   10,   11,   16,    9,   17,   25,   15,   20,   11,
};
#define YYFINAL 2
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
#define YYMAXTOKEN 22
#if YYDEBUG
const char * const yyname[] = {
"end-of-file","STRINGCONST","INTEGERCONST","CHARCONST","PLUSNUM","TIMESNUM",
"IFNUM","THENNUM","ELSENUM","EQUALNUM","IDNUM","LPARENNUM","RPARENNUM",
"SEMINUM","COMMANUM","BEGINNUM","ENDNUM","PROGRAMNUM","ISNUM","MINUSNUM",
"DIVNUM","VARNUM","PRINTNUM",
};
const char * const yyrule[] = {
"$accept : program",
"program : PROGRAMNUM IDNUM ISNUM declaration compoundstatement",
"declaration : VARNUM declaration2",
"declaration2 : IDNUM COMMANUM declaration2",
"declaration2 : IDNUM",
"compoundstatement : BEGINNUM compoundstatement2",
"compoundstatement2 : statement SEMINUM compoundstatement2",
"compoundstatement2 : statement ENDNUM",
"statement : IDNUM EQUALNUM exp",
"statement : PRINTNUM exp",
"exp : exp PLUSNUM term",
"exp : exp MINUSNUM term",
"exp : term",
"exp : MINUSNUM term",
"term : term TIMESNUM factor",
"term : term DIVNUM factor",
"term : factor",
"factor : INTEGERCONST",
"factor : IDNUM",
"factor : LPARENNUM exp RPARENNUM",
};
#endif
#if YYDEBUG
#include <stdio.h>
#endif
#ifdef YYSTACKSIZE
#undef YYMAXDEPTH
#define YYMAXDEPTH YYSTACKSIZE
#else
#ifdef YYMAXDEPTH
#define YYSTACKSIZE YYMAXDEPTH
#else
#define YYSTACKSIZE 10000
#define YYMAXDEPTH 10000
#endif
#endif
#define YYINITSTACKSIZE 200
int yydebug;
int yynerrs;
int yyerrflag;
int yychar;
short *yyssp;
YYSTYPE *yyvsp;
YYSTYPE yyval;
YYSTYPE yylval;
short *yyss;
short *yysslim;
YYSTYPE *yyvs;
int yystacksize;
#line 95 "example0.y"


#include "lex.yy.c"
#include <stdio.h>


typedef struct{
	char * var_name;
	int initialized;
	int val;
}Vars;

Vars VarArray[100];
int i = 0;

checkDuplicate(char* id)
{
	int n;
	for(n = 0; n < i; n++)
	{
		if(!strcmp(id, VarArray[n].var_name))
		{
			printf("Duplicate ID Error at line %d\n", yyline);
			exit(1);
		}
	}
}


checkInitialize(char * id)
{

	int p;
	for(p = 0; p < i; p++)
	{
		if(!strcmp(id, VarArray[p].var_name))
		{
			if(VarArray[p].initialized == 0)
			{
				printf("Unitialized Variable Error at line %d\n", yyline);
				exit(1);
			}
		}
	}
}
	


void checkDenominator(int x)
{
	if(x == 0)
	{	
		printf("Divide by 0 Error at line %d\n", yyline);
		exit(1);
	}
}

int returnVal(char * id)
{
	int j;
	for(j = 0; j < i; j++)
	{
		if(!strcmp(id, VarArray[j].var_name))
			return VarArray[j].val;
	}

}

void AssignVal(char * id, int x)
{
	int m;
	for(m = 0; m < i; m++)
	{	
		if(!strcmp(id, VarArray[m].var_name))
		{
			VarArray[m].val = x;
			VarArray[m].initialized = 1;
		}
	}
}




yyerror(str)
char *str;
{    printf("yyerror: %s at line %d\n", str, yyline);
}


main()
{
  if (!yyparse()) {printf("accept\n");}
  else printf("reject\n");
}    









#line 263 "y.tab.c"
/* allocate initial stack or double stack size, up to YYMAXDEPTH */
static int yygrowstack()
{
    int newsize, i;
    short *newss;
    YYSTYPE *newvs;

    if ((newsize = yystacksize) == 0)
        newsize = YYINITSTACKSIZE;
    else if (newsize >= YYMAXDEPTH)
        return -1;
    else if ((newsize *= 2) > YYMAXDEPTH)
        newsize = YYMAXDEPTH;
    i = yyssp - yyss;
    newss = yyss ? (short *)realloc(yyss, newsize * sizeof *newss) :
      (short *)malloc(newsize * sizeof *newss);
    if (newss == NULL)
        return -1;
    yyss = newss;
    yyssp = newss + i;
    newvs = yyvs ? (YYSTYPE *)realloc(yyvs, newsize * sizeof *newvs) :
      (YYSTYPE *)malloc(newsize * sizeof *newvs);
    if (newvs == NULL)
        return -1;
    yyvs = newvs;
    yyvsp = newvs + i;
    yystacksize = newsize;
    yysslim = yyss + newsize - 1;
    return 0;
}

#define YYABORT goto yyabort
#define YYREJECT goto yyabort
#define YYACCEPT goto yyaccept
#define YYERROR goto yyerrlab

#ifndef YYPARSE_PARAM
#if defined(__cplusplus) || __STDC__
#define YYPARSE_PARAM_ARG void
#define YYPARSE_PARAM_DECL
#else	/* ! ANSI-C/C++ */
#define YYPARSE_PARAM_ARG
#define YYPARSE_PARAM_DECL
#endif	/* ANSI-C/C++ */
#else	/* YYPARSE_PARAM */
#ifndef YYPARSE_PARAM_TYPE
#define YYPARSE_PARAM_TYPE void *
#endif
#if defined(__cplusplus) || __STDC__
#define YYPARSE_PARAM_ARG YYPARSE_PARAM_TYPE YYPARSE_PARAM
#define YYPARSE_PARAM_DECL
#else	/* ! ANSI-C/C++ */
#define YYPARSE_PARAM_ARG YYPARSE_PARAM
#define YYPARSE_PARAM_DECL YYPARSE_PARAM_TYPE YYPARSE_PARAM;
#endif	/* ANSI-C/C++ */
#endif	/* ! YYPARSE_PARAM */

int
yyparse (YYPARSE_PARAM_ARG)
    YYPARSE_PARAM_DECL
{
    register int yym, yyn, yystate;
#if YYDEBUG
    register const char *yys;

    if ((yys = getenv("YYDEBUG")))
    {
        yyn = *yys;
        if (yyn >= '0' && yyn <= '9')
            yydebug = yyn - '0';
    }
#endif

    yynerrs = 0;
    yyerrflag = 0;
    yychar = (-1);

    if (yyss == NULL && yygrowstack()) goto yyoverflow;
    yyssp = yyss;
    yyvsp = yyvs;
    *yyssp = yystate = 0;

yyloop:
    if ((yyn = yydefred[yystate])) goto yyreduce;
    if (yychar < 0)
    {
        if ((yychar = yylex()) < 0) yychar = 0;
#if YYDEBUG
        if (yydebug)
        {
            yys = 0;
            if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
            if (!yys) yys = "illegal-symbol";
            printf("%sdebug: state %d, reading %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
    }
    if ((yyn = yysindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: state %d, shifting to state %d\n",
                    YYPREFIX, yystate, yytable[yyn]);
#endif
        if (yyssp >= yysslim && yygrowstack())
        {
            goto yyoverflow;
        }
        *++yyssp = yystate = yytable[yyn];
        *++yyvsp = yylval;
        yychar = (-1);
        if (yyerrflag > 0)  --yyerrflag;
        goto yyloop;
    }
    if ((yyn = yyrindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
        yyn = yytable[yyn];
        goto yyreduce;
    }
    if (yyerrflag) goto yyinrecovery;
#if defined(lint) || defined(__GNUC__)
    goto yynewerror;
#endif
yynewerror:
    yyerror("syntax error");
#if defined(lint) || defined(__GNUC__)
    goto yyerrlab;
#endif
yyerrlab:
    ++yynerrs;
yyinrecovery:
    if (yyerrflag < 3)
    {
        yyerrflag = 3;
        for (;;)
        {
            if ((yyn = yysindex[*yyssp]) && (yyn += YYERRCODE) >= 0 &&
                    yyn <= YYTABLESIZE && yycheck[yyn] == YYERRCODE)
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: state %d, error recovery shifting\
 to state %d\n", YYPREFIX, *yyssp, yytable[yyn]);
#endif
                if (yyssp >= yysslim && yygrowstack())
                {
                    goto yyoverflow;
                }
                *++yyssp = yystate = yytable[yyn];
                *++yyvsp = yylval;
                goto yyloop;
            }
            else
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: error recovery discarding state %d\n",
                            YYPREFIX, *yyssp);
#endif
                if (yyssp <= yyss) goto yyabort;
                --yyssp;
                --yyvsp;
            }
        }
    }
    else
    {
        if (yychar == 0) goto yyabort;
#if YYDEBUG
        if (yydebug)
        {
            yys = 0;
            if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
            if (!yys) yys = "illegal-symbol";
            printf("%sdebug: state %d, error recovery discards token %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
        yychar = (-1);
        goto yyloop;
    }
yyreduce:
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: state %d, reducing by rule %d (%s)\n",
                YYPREFIX, yystate, yyn, yyrule[yyn]);
#endif
    yym = yylen[yyn];
    yyval = yyvsp[1-yym];
    switch (yyn)
    {
case 3:
#line 51 "example0.y"
{checkDuplicate(yyvsp[-2].var);VarArray[i].var_name = yyvsp[-2].var; VarArray[i].initialized = 0; i++;}
break;
case 4:
#line 53 "example0.y"
{checkDuplicate(yyvsp[0].var);VarArray[i].var_name = yyvsp[0].var; VarArray[i].initialized = 0; i++;}
break;
case 8:
#line 65 "example0.y"
{AssignVal(yyvsp[-2].var, yyvsp[0].semantic_value);}
break;
case 9:
#line 67 "example0.y"
{printf("%d", yyvsp[0].semantic_value);}
break;
case 10:
#line 71 "example0.y"
{yyval.semantic_value = yyvsp[-2].semantic_value + yyvsp[0].semantic_value;}
break;
case 11:
#line 73 "example0.y"
{yyval.semantic_value = yyvsp[-2].semantic_value - yyvsp[0].semantic_value;}
break;
case 12:
#line 75 "example0.y"
{yyval.semantic_value = yyvsp[0].semantic_value;}
break;
case 13:
#line 77 "example0.y"
{yyval.semantic_value = -yyvsp[0].semantic_value;}
break;
case 14:
#line 80 "example0.y"
{yyval.semantic_value = yyvsp[-2].semantic_value * yyvsp[0].semantic_value;}
break;
case 15:
#line 82 "example0.y"
{checkDenominator(yyvsp[0].semantic_value); yyval.semantic_value = yyvsp[-2].semantic_value / yyvsp[0].semantic_value;}
break;
case 16:
#line 84 "example0.y"
{yyval.semantic_value = yyvsp[0].semantic_value;}
break;
case 17:
#line 88 "example0.y"
{yyval.semantic_value = yyvsp[0].semantic_value;}
break;
case 18:
#line 90 "example0.y"
{checkInitialize(yyvsp[0].var);yyval.semantic_value = returnVal(yyvsp[0].var);}
break;
case 19:
#line 92 "example0.y"
{yyval.semantic_value = yyvsp[-1].semantic_value;}
break;
#line 514 "y.tab.c"
    }
    yyssp -= yym;
    yystate = *yyssp;
    yyvsp -= yym;
    yym = yylhs[yyn];
    if (yystate == 0 && yym == 0)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: after reduction, shifting from state 0 to\
 state %d\n", YYPREFIX, YYFINAL);
#endif
        yystate = YYFINAL;
        *++yyssp = YYFINAL;
        *++yyvsp = yyval;
        if (yychar < 0)
        {
            if ((yychar = yylex()) < 0) yychar = 0;
#if YYDEBUG
            if (yydebug)
            {
                yys = 0;
                if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
                if (!yys) yys = "illegal-symbol";
                printf("%sdebug: state %d, reading %d (%s)\n",
                        YYPREFIX, YYFINAL, yychar, yys);
            }
#endif
        }
        if (yychar == 0) goto yyaccept;
        goto yyloop;
    }
    if ((yyn = yygindex[yym]) && (yyn += yystate) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yystate)
        yystate = yytable[yyn];
    else
        yystate = yydgoto[yym];
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: after reduction, shifting from state %d \
to state %d\n", YYPREFIX, *yyssp, yystate);
#endif
    if (yyssp >= yysslim && yygrowstack())
    {
        goto yyoverflow;
    }
    *++yyssp = yystate;
    *++yyvsp = yyval;
    goto yyloop;
yyoverflow:
    yyerror("yacc stack overflow");
yyabort:
    return (1);
yyaccept:
    return (0);
}
