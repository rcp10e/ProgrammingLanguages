%%
[ \t]+$      ;
%%
int yywrap()
{  if (feof(stdin)) return 1;
   return 0;
}
