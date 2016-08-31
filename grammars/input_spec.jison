
%token Identifier
%token Constant
%token INT_TYPE FLOAT_TYPE DOUBLE_TYPE UNUM_TYPE
%token INPUT COMPUTE OUTPUT
%token ';'
%token '(' ')' '{' '}' '[' ']'
%token '+' '-' '*' '/' '%'
%token '>' '<'
%token GE LE EQ NQ
%token '&' '|' '^'
%token '='

// precedence table

%right	'='
%left	'|'
%left	'^'
%left	'&'
%left	EQ NE
%left 	'<' '>' GE LE
%left	'+' '-'
%left	'*' '/' '%'

%%

compute_statement
		: INPUT '(' set_definition ')' recurrence_specification

set_definition
		: '(' dimension_list ')' '|' constraint_list

dimension_list
		: Identifier
		| dimension_list ',' Identifier

constraint_list
		: expression
		| constraint_list ',' expression

recurrence_specification
		: '{' recurrence_statements '}'

recurrence_statements
		: /* empty */
		| recurrence_statement
		| recurrence_statements recurrence_statement

recurrence_statement
		: input_sa_statement

input_sa_statement
		: domain_flow_var_lhs '=' ram_var ';'

domain_flow_var_lhs
		: Identifier '(' index_space_dimension_list ')'

ram_var
		: Identifier '[' index_space_dimension_list ']'

index_space_dimension_list
		: Identifier
		| index_space_dimension_list ',' Identifier
