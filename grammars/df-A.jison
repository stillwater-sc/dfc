
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
		: COMPUTE '(' set_definition ')' recurrence_specification

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
		| compute_sa_statement
		| output_sa_statement

input_sa_statement
		: domain_flow_var_lhs '=' ram_var ';'

output_sa_statement
		: ram_var '=' domain_flow_var_rhs ';'

compute_sa_statement
		: domain_flow_var_lhs '=' recurrence_expression ';'

domain_flow_var_lhs
		: Identifier '(' index_space_dimension_list ')'

ram_var
		: Identifier '[' index_space_dimension_list ']'

index_space_dimension_list
		: Identifier
		| index_space_dimension_list ',' Identifier

domain_flow_var_rhs
		: Identifier '(' index_space_expression_list ')'

recurrence_expression
		: domain_flow_binary

domain_flow_binary
		: domain_flow_var_rhs
		| Constant
		| Identifier '(' optional_argument_list ')'
		| domain_flow_binary '+' domain_flow_binary
		| domain_flow_binary '*' domain_flow_binary

index_space_expression_list
		: binary
		| index_space_expression_list ',' binary

expression
		: binary
		| expression ',' binary

binary
		: Identifier
		| Constant
		| '(' expression ')'
		| Identifier '(' optional_argument_list ')'
		| binary '+' binary
		| binary '-' binary
		| binary '*' binary
		| binary '/' binary
		| binary '%' binary
		| binary '>' binary
		| binary '<' binary
		| binary 'GE' binary
		| binary 'LE' binary
		| binary 'EQ' binary
		| binary 'NE' binary
		| binary '&' binary
		| binary '|' binary
		| binary '^' binary
		| Identifier '=' binary

optional_argument_list
		: /* no arguments */
		| argument_list

argument_list
		: binary
		| argument_list ',' binary		