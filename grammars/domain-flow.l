digit                       [0-9]
id                          [a-zA-Z_][a-zA-Z0-9_]*

%%
"//".*                      /* ignore single-line comment */
"/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/"    /* ignore multi-line comment */
"var"                       return 'VAR';
"null"                      return 'NIL';
"input"						return 'INPUT';       /* temporary keyword tokens */
"compute"					return 'COMPUTE';
"output"				    return 'OUTPUT';
{digit}+                    return 'INT_LITERAL';
{id}                        return 'IDENTIFIER';
":="                        return 'ASSIGN';
"<="						return 'LE';
">="						return 'GE';
"=="						return 'EQ';
"!="                        return 'NE';
"<"							return 'LT';
">"							return 'GT';
"="							return '='
"{"							return '{';
"}"							return '}';
"("							return '(';
")"							return ')';
"["							return '[';
"]"							return ']';
","							return ',';
"|"							return '|';
"+"							return '+';
"-"							return '-';
"*"							return '*';
"/"							return '/';
"%"							return '%';
";"                         return 'SEMICOLON';
\s+                         /* skip whitespace */
"."                         throw 'Illegal character';
<<EOF>>                     return 'ENDOFFILE';
