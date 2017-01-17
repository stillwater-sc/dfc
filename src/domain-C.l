%{
#define TOKEN_VAR		0;
#define TOKEN_NIL		1;
#define TOKEN_INPUT		2;
#define TOKEN_COMPUTE		3;
#define TOKEN_OUTPUT		4;
#define TOKEN_INT_LITERAL	5;
#define TOKEN_IDENTIFIER	6;
#define TOKEN_ASSIGN		7;
#define TOKEN_LE		8;
#define TOKEN_GE		9;
#define TOKEN_EQ		10;
#define TOKEN_NE		11;
#define TOKEN_LT		12;
#define TOKEN_GT		13;

#define TOKEN_EOF		255;


%}

digit                       [0-9]
id                          [a-zA-Z_][a-zA-Z0-9_]*

%%
"//".*                      /* ignore single-line comment */
"/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/"    /* ignore multi-line comment */
"var"           return TOKEN_VAR;
"null"          return TOKEN_NIL;
"input"		return TOKEN_INPUT;
"compute"	return TOKEN_COMPUTE;
"output"	return TOKEN_OUTPUT;
{digit}+        return TOKEN_INT_LITERAL;
{id}            return TOKEN_IDENTIFIER;
":="            return TOKEN_ASSIGN;
"<="		return TOKEN_LE;
">="		return TOKEN_GE;
"=="		return TOKEN_EQ;
"!="            return TOKEN_NE;
"<"		return TOKEN_LT;
">"		return TOKEN_GT;
"="		return '=';
"{"		return '{';
"}"		return '}';
"("		return '(';
")"		return ')';
"["		return '[';
"]"		return ']';
","		return ',';
"|"		return '|';
"+"		return '+';
"-"		return '-';
"*"		return '*';
"/"		return '/';
"%"		return '%';
";"             return ';';
\s+             /* skip whitespace */
"."             return '.';
<<EOF>>         return TOKEN_EOF;
