SRCS = 	src/strlen.asm

INCLUDES = include

OBJS = $(SRCS:.asm=.o)

NAME = libasm.so

all :
	nasm -f elf64 $(SRCS) -o $(OBJS) && gcc -shared $(OBJS) -o $(NAME) -fPIC

clean :
	rm $(OBJS)

fclean:
	rm $(OBJS)
	rm $(NAME)

re : fclean all

test:	re
	gcc -L$(PWD) -Wall -o main_test -iquote ./include main_test.c -lmy_malloc -g3

.PHONY: all clean flcean re export test
