
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

program
		: definitions

definitions
		: definition
		| definitions definition

definition
		: function_definition
		| INT function_definition
		| declaration

function_definition
		: Identifier '(' optional_parameter_list ')'
		  parameter_declarations compound_statement

optional_parameter_list
		: /* no formal parameters */
		| parameter_list

parameter_list
		: Identifier
		| parameter_list ',' Identifier

parameter_declarations
		: /* null */
		| parameter_declarations parameter_declaration

parameter_declaration
		: INT parameter_declarator_list ';'

parameter_declarator_list
		: Identifier
		| parameter_declarator_list ',' Identifier

compound_statement
		: '{' declarations statements '}'

declarations
		: /* null */
		| declarations declaration

declaration
		: INT declarator_list ';'

declarator_list
		: Identifier
		| declarator_list ',' Identifier

statements
		: /* null */
		| statements statement

statement
		: expression ';'
		| ';'
		| compound_statement
		| compute_statement

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
		: '{' recurrence_list '}'

recurrence_list
		: compute_sa_expression
		| recurrence_list ';' compute_sa_expression

compute_sa_expression
		: domain_flow_var '=' ram_var

domain_flow_var
		: Identifier '(' domain_flow_dimension_list ')'

domain_flow_dimension_list
		: Identifier
		| domain_flow_dimension_list ',' Identifier

ram_var
		: Identifier '[' domain_flow_dimension_list ']'

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