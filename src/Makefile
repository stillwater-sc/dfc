# Makefile
#

OBJS		= parser.o lexer.o main.o

CC		= cl.exe
CFLAGS		= 

GCC		= g++
GCCFLAGS	= -g -Wall -ansi -pedantic
	
dfc:		$(OBJS)
		$(CC) $(CFLAGS) $(OBJS) -o dfc -lfl

lex.o:		lexer.c
		$(CC) $(CFLAGS) -c lexer.c -o lexer.o

lexer.c:	domain-C.l
		flex domain-C.l
		cp lex.yy.c lexer.c

parser.o:	parser.c
		$(CC) $(CFLAGS) -c parser.c -o parser.o

parser.c:	domain-C.y
		bison -d -v domain-C.y
		cp domain-C.tab.c parser.c
		cmp -s domain-C.tab.h tok.h || cp domain-C.tab.h tok.h

main.o:		main.cpp
		$(CC) $(CFLAGS) -c main.cpp -o main.o

lexer.o domainC.o main.o	: header.h

lexer.o main.o			: tok.h

clean:
	rm -f *.o *~ lexer.c lex.yy.c parser.c tok.h domain-C.tab.c domain-C.tab.h domain-C.output dfc
