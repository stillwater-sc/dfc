digit                       [0-9]
id                          [a-zA-Z_][a-zA-Z0-9_]*

%%
"//".*                      /* ignore single-line comment */
"/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/"    /* ignore multi-line comment */
"var"                       return 'VAR';
"null"                      return 'NUL';
"input"						return 'INPUT';       /* temporary keyword tokens */
"compute"					return 'COMPUTE';
"output"				    return 'OUTPUT';
{digit}+                    return 'INT_LITERAL';
{id}                        return 'IDENTIFIER';
":="                        return 'ASSIGN';
"<="						return 'LE';
">="						return 'GE';
"=="						return 'EQUAL';
"<"							return 'LT';
">"							return 'GT';
"="							return 'CONSTRAINT_EQ'
"{"							return 'LCURLY';
"}"							return 'RCURLY';
"("							return 'LPAREN';
")"							return 'RPAREN';
"["							return 'LBRACKET';
"]"							return 'RBRACKET';
","							return 'COMMA';
"|"							return 'BAR';
"+"							return 'PLUS';
"-"							return 'MINUS';
"*"							return 'STAR';
"/"							return 'SLASH';
"%"							return 'PERCENT';
";"                         return 'SEMICOLON';
\s+                         /* skip whitespace */
"."                         throw 'Illegal character';
<<EOF>>                     return 'ENDOFFILE';
