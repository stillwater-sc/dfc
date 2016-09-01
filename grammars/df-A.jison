
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

%start compute_statement

%%

compute_statement
		: COMPUTE '(' set_definition ')' '{' recurrence_statements '}'
		;

set_definition
		: '(' dimension_list ')' '|' constraint_list
		;

dimension_list
		: Identifier
		| dimension_list ',' Identifier
		;

constraint_list
		: constraint
		| constraint_list ',' constraint
		;

constraint
        : cexpression 'EQ' cexpression
        | cexpression 'LE' cexpression
        | cexpression 'GE' cexpression
        | cexpression '<' cexpression
        | cexpression '>' cexpression
        ;

cexpression
		: constraint_equation
		;

constraint_equation
		: Constant
		| Identifier
		| constraint_equation '+' constraint_equation
		| constraint_equation '-' constraint_equation
		| constraint_equation '*' constraint_equation
		| constraint_equation '/' constraint_equation
		| constraint_equation '%' constraint_equation
		;

recurrence_statements
		: recurrence_statement
		| recurrence_statements recurrence_statement
		;

recurrence_statement
		: compute_sa_statement
		;

compute_sa_statement
		: domain_flow_var_lhs '=' recurrence_expression ';'
		;

domain_flow_var_lhs
		: Identifier '(' index_space_dimension_list ')'
		;

index_space_dimension_list
		: Identifier
		| index_space_dimension_list ',' Identifier
		;

recurrence_expression
		: domain_flow_binary
		;

domain_flow_binary
		: domain_flow_var_rhs
		| Constant
		| domain_flow_binary '+' domain_flow_binary
		| domain_flow_binary '*' domain_flow_binary
		;

domain_flow_var_rhs
		: Identifier '(' index_space_expression_list ')'
		;

index_space_expression_list
		: index_binary
		| index_space_expression_list ',' index_binary
		;

index_binary
		: Identifier
		| Constant
		| index_binary '+' index_binary
		| index_binary '-' index_binary
		;	