%{
#define ENDOFFILE (0)
#define CCOMMENT (1)
#define STUFF (2)
%}

%%

"/*".*"*/"	return CCOMMENT;
<<EOF>>		return ENDOFFILE;

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
