#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>
#include <iomanip>
using namespace std;

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

void checkChar(string&);
void makeUpper(string&);
extern int yylval;
extern vector<string> string_table;
extern int yylex();

main()
{
  int i;

  while (i=yylex()) {
    switch(i) {
    	case ID: { makeUpper(string_table[yylval]);
      	cout << setw(15) << right << "IDtoken, " << string_table[yylval] << "\n";
      	break;}
    	case SCONST: {checkChar(string_table[yylval]);  makeUpper(string_table[yylval]);
      	cout << setw(15) << right << "SCONSTtoken, " << string_table[yylval] << "\n";
      	break;}
    	case ICONST: {
      	cout << setw(15) << right << "ICONSTtoken, " << yylval << "\n";
      	break;}
    	case CCONST: {makeUpper(string_table[yylval]);
      	cout << setw(15) << right << "CCONSTtoken, " << string_table[yylval] << "\n"; 
     	break;}
    	case PLUS: {
      	cout << setw(15) << right << "PLUStoken\n"; break;}
    	case TIMES: {
      	cout << setw(15) << right << "TIMEStoken\n"; break;}
    	case IF: { cout << setw(15) << right << "IFtoken\n"; break;}
    	case THEN: { cout << setw(15) << right << "THENtoken\n"; break;}
    	case ELSE: { cout << setw(15) << right << "ELSEtoken\n"; break;}
    	case EQ: { cout << setw(15) << right << "EQtoken\n"; break;}
    	case PROGRAM: { cout << setw(15) << right << "PROGRAMtoken\n"; break;}
    	case IS: { cout << setw(15) << right << "IStoken\n"; break;}
    	case BEGINNUM: { cout << setw(15) << right << "BEGINtoken\n"; break;}
     	case AND: { cout << setw(15) << right << "ANDtoken\n"; break;}
	case ARRAY: { cout << setw(15) << right << "ARRAYtoken\n"; break;}
	case CONST: { cout << setw(15) << right << "CONSTtoken\n"; break;}
	case DIV: { cout << setw(15) << right << "DIVtoken\n"; break;}
	case DOWNTO: { cout << setw(15) << right << "DOWNTOtoken\n"; break;}
	case ELSIF: { cout << setw(15) << right << "ELSIFtoken\n"; break;}
	case ENDIF: { cout << setw(15) << right << "ENDIFtoken\n"; break;}
	case ENDLOOP: { cout << setw(15) << right << "ENDLOOPtoken\n"; break;}
	case ENDREC: { cout << setw(15) << right << "ENDRECtoken\n"; break;}
	case EXIT: { cout << setw(15) << right << "EXITtoken\n"; break;}
	case FOR: { cout << setw(15) << right << "FORtoken\n"; break;}
	case FORWARD: { cout << setw(15) << right << "FORWARDtoken\n"; break;}
	case FUNCTION: { cout << setw(15) << right << "FUNCTIONtoken\n"; break;}
	case LOOP: { cout << setw(15) << right << "LOOPtoken\n"; break;}
	case NOT: { cout << setw(15) << right << "NOTtoken\n"; break;}
	case OF: { cout << setw(15) << right << "OFtoken\n"; break;}
	case OR: { cout << setw(15) << right << "ORtoken\n"; break;}
	case PROCEDURE: { cout << setw(15) << right << "PROCEDUREtoken\n"; break;}
	case RECORD: { cout << setw(15) << right << "RECORDtoken\n"; break;}
	case REPEAT: { cout << setw(15) << right << "REPEATtoken\n"; break;}
	case RETURN: { cout << setw(15) << right << "RETURNtoken\n"; break;}
	case TO: { cout << setw(15) << right << "TOtoken\n"; break;}
	case TYPE: { cout << setw(15) << right << "TYPEtoken\n"; break;}
	case UNTIL: { cout << setw(15) << right << "UNTILtoken\n"; break;}
	case VAR: { cout << setw(15) << right << "VARtoken\n"; break;}
	case WHILE: { cout << setw(15) << right << "WHILEtoken\n"; break;}
	case PRINT: { cout << setw(15) << right << "PRINTtoken\n"; break;}
	case MINUS: { cout << setw(15) << right << "MINUStoken\n"; break;}
	case COLON: { cout << setw(15) << right << "COLONtoken\n"; break;}
	case SEMI: { cout << setw(15) << right << "SEMItoken\n"; break;}
	case COMMA: { cout << setw(15) << right << "COMMAtoken\n"; break;}
	case DOT: { cout << setw(15) << right << "DOTtoken\n"; break;}
	case LPAREN: { cout << setw(15) << right <<  "LPARENtoken\n"; break;}
	case RPAREN: { cout << setw(15) << right << "RPARENtoken\n"; break;}
	case LT: { cout << setw(15) << right << "LTtoken\n"; break;}
	case GT: { cout << setw(15) << right << "GTtoken\n"; break;}
	case DOTDOT: { cout << setw(15) << right << "DOTDOTtoken\n"; break;}
	case COLEQ: { cout << setw(15) << right << "COLEQtoken\n"; break;}
	case LE: { cout << setw(15) << right << "LEtoken\n"; break;}
	case GE: { cout << setw(15) << right << "GEtoken\n"; break;}
	case NE: { cout << setw(15) << right << "NEtoken\n"; break;}
	case ENDOFFILE: { cout <<setw(15) << right <<  "ENDOFFILEtoken\n"; break;}
	case END: {cout << setw(15) << right << "ENDtoken\n"; break;}
    default: {cout << setw(15) << right << "Unknown token: " << i << "\n";}
    }
  }
cout << setw(15) << right << "EOFtoken\n";
}


void checkChar(string& word)
{
	for(int i = 0; i < word.size(); i++)
	{
		if(word[i] == '\\')
		{

			if(word[i + 1] == 'n')
			{	word.erase(i + 1, 1); 
				word[i] = 10;
			}
			else if(word[i + 1] == 't')
			{	word.erase(i + 1, 1); 
				word[i] = 9;
			}
			else if(word[i + 1] == '\'')
			{	word.erase(i + 1, 1); 
				word[i] = 39;
			}
			else if(word[i + 1] == '\\')
			{	word.erase(i + 1, 1); 
				word[i] = 92;
			}
		}
	}
}


void makeUpper(string& word)
{
	for(int i = 0; i < word.size(); i++)
	{
		word[i] = toupper(word[i]);
	}
}
