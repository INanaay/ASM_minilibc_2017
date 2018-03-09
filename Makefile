SRCS =  src/strlen.asm  \
	src/strchr.asm	\
	src/memset.asm	\
	src/memcpy.asm	\
	src/strcmp.asm	\
	src/strncmp.asm	\
	src/rindex.asm	\
	src/strcasecmp.asm

CC	= gcc

CFLAGS	= -fPIC -shared

NA = nasm

ASMFLAGS = -f elf64

RM = rm -rf

NAME = libasm.so

OBJS =  $(SRCS:.asm=.o)

all: $(NAME)

$(NAME): $(OBJS)
	gcc -shared $(OBJS) -o libasm.so -fPIC

%.o: %.asm
	$(NA) $(ASMFLAGS) $< -o $@

clean:
	$(RM) $(OBJS)

fclean : clean
	$(RM) $(OBJS)
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
