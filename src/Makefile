# Makefile
#

OBJS		= parser.o lexer.o main.o

GCC		= gcc
GCCFLAGS	= -g -Wall -ansi -pedantic
	
dfc:		$(OBJS)
		$(CC) $(CFLAGS) $(OBJS) -o dfc 

lexer.o:	lexer.c
		$(CC) $(CFLAGS) -o lexer.o -c lexer.c

lexer.c:	domain-C.l
		flex domain-C.l
		cp lex.yy.c lexer.c

parser.o:	parser.c
		$(CC) $(CFLAGS) -o parser.o -c parser.c 

parser.c:	domain-C.y
		bison -d -v domain-C.y
		cp domain-C.tab.c parser.c
		cmp -s domain-C.tab.h tok.h || cp domain-C.tab.h tok.h

main.o:		main.cpp
		$(CC) $(CFLAGS) -o main.o -c main.cpp 

lexer.o domainC.o main.o	: heading.h

lexer.o main.o			: tok.h

clean:
	rm -f *.o *~ lexer.c lex.yy.c parser.c tok.h domain-C.tab.c domain-C.tab.h domain-C.output dfc
