The Domain Flow Language and Compiler
=====================================

# Prerequisites

## Installation
Install Node environment
https://nodejs.org/en/download/

Install jison and jison-lex
> npm install jison -g

> npm install jison-lex -g

Clone the github repository:
> git clone https://github.com/stillwater-sc/dfc

## Generate a new parser
> TBD

## Usage from the command line
At the root of the tree, issue node commands.

Use the lexer
> node js/lexer.js domain-flow.l kernels/kernel_prototype.dfa
```
C:\Users\Theodore\dev\dfc>node js/lexer.js domain-flow.l kernels/kernel_prototype.dfa
{ lexfile: 'domain-flow.l',
  file: 'kernels/kernel_prototype.dfa',
  _: [ 'domain-flow.l', 'kernels/kernel_prototype.dfa' ] }
Processing kernels/kernel_prototype.dfa with domain-flow.l
Token : IDENTIFIER
Token : LT
Token : IDENTIFIER
Token : GT
Token : IDENTIFIER
Token : LPAREN
Token : IDENTIFIER
Token : LT
Token : IDENTIFIER
Token : GT
Token : IDENTIFIER
Token : COMMA
Token : IDENTIFIER
Token : COMMA
Token : IDENTIFIER
Token : COMMA
Token : IDENTIFIER
Token : RPAREN
Done...
```

Use the parser to generate, x, y, and z
> TBD