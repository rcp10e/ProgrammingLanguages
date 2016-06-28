
/* this file define all teh integer values corresponse with 
 * each type of token.
 */

%union {
  int semantic_value;
  char * var;
}

%token   EOFnumber		             				0	
%token   STRINGCONST		           				1
%token   <semantic_value>INTEGERCONST          				2
%token   CHARCONST		             				3
%token   PLUSNUM		               				4
%token   TIMESNUM		              				5
%token   IFNUM		                 				6
%token   THENNUM		               				7
%token   ELSENUM 		              				8
%token   EQUALNUM		              				9
%token   <var>IDNUM				                 	10
%token   LPARENNUM		             				11
%token   RPARENNUM		             				12
%token 	 SEMINUM			      				13
%token   COMMANUM			       				14
%token   BEGINNUM		              				15
%token   ENDNUM		                				16
%token   PROGRAMNUM		            				17
%token   ISNUM		                 				18
%token   MINUSNUM		              				19
%token   DIVNUM		                				20
%token   VARNUM		                				21
%token   PRINTNUM 		             				22	


%type<semantic_value>exp
%type<semantic_value>term
%type<semantic_value>factor 



%%   /* specification */

program : PROGRAMNUM IDNUM ISNUM declaration compoundstatement
	;

declaration : VARNUM declaration2
	    ;

declaration2 : IDNUM COMMANUM declaration2
		{checkDuplicate($1);VarArray[i].var_name = $1; VarArray[i].initialized = 0; i++;}
             | IDNUM 
		{checkDuplicate($1);VarArray[i].var_name = $1; VarArray[i].initialized = 0; i++;}
             ;

compoundstatement : BEGINNUM compoundstatement2 
               	  ;	

compoundstatement2 : statement SEMINUM compoundstatement2
                   | statement ENDNUM
		
                   ;                    
		
statement : IDNUM EQUALNUM exp
		{AssignVal($1, $3);}	
	  | PRINTNUM exp
		{printf("%d", $2);}		
          ;

exp : exp PLUSNUM term
		{$$ = $1 + $3;}
    | exp MINUSNUM term
		{$$ = $1 - $3;}
    | term 
		{$$ = $1;}
    | MINUSNUM term
		{$$ = -$2;}
    ;
term : term TIMESNUM factor
		{$$ = $1 * $3;}
     | term DIVNUM factor
		{checkDenominator($3); $$ = $1 / $3;}
     | factor
		{$$ = $1;}
     ;

factor : INTEGERCONST
		{$$ = $1;}
       | IDNUM
		{checkInitialize($1);$$ = returnVal($1);}
       | LPARENNUM exp RPARENNUM
        	 {$$ = $2;}
       ;
%%


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









