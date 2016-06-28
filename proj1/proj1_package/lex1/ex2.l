%{
#include <iostream>
using namespace std;
%}

%%
colour        cout << "color";
behaviour     cout << "behavior";
"/*".*"*/"    cout << "comment = " << yytext << "\n";
%%

int yywrap()
{  if (feof(stdin)) return 1;
   return 0;
}
