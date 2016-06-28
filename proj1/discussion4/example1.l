%{
int mymylineno = 1;

#define ENDOFFILE (0)
#define MATCH (1)
#define NONMATCH (2)
%}

%%

^[sc]h.*m$	return MATCH;

^.+$		return NONMATCH;

[ \t]+		return NONMATCH;
[\n]		mymylineno++;
<<EOF>>		return ENDOFFILE;

%%

int main()
{
  int retval;

  yyin = stdin;
  while ((retval = yylex ()) != ENDOFFILE)
    {
      if (retval == MATCH)
	fprintf(stdout, "%d:%s\n", mymylineno, yytext);
    }
}
