SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)

all: server client

server: ft_server.o libft
	gcc -o server ft_server.o -Llibft -lft

client: ft_client.o libft
	gcc -o client ft_client.o -Llibft -lft

%.o: %.c
	gcc -c -Wall -Wextra -Werror $?

libft:
	make -C libft

clean:
	rm -f $(OBJECTS)
	make -C libft clean

fclean: clean
	rm -f server client libft/libft.a

re: fclean all

.PHONY: all libft clean fclean re
