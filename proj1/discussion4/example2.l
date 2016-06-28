%{
void makelower(char *);

#define ENDOFFILE (0)
#define UPPER (1)
#define OTHER (2)
%}

%%

[A-Z]+	 return UPPER;
[^A-Z]+  return OTHER;
<<EOF>>  return ENDOFFILE;

%%

void
makelower (char *str)
{
  while (*str)
    {
      if (*str >= 'A' && *str <= 'Z')
	*str -= ('A' - 'a');
      str++;
    }
}

int
main ()
{
  int retval;

  yyin = stdin;
  while ((retval = yylex ()) != ENDOFFILE)
    {
      switch (retval)
	{
	case UPPER:
	  makelower (yytext);
	case OTHER:
	  fprintf (stdout, "%s", yytext);
	  break;
	}
    }
}
