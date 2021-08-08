SERVER = server
CLIENT = client
SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)
LIBFT_PATH = libft/
LIBFT_NAME = libft.a
LIBFT_OBJECTS = $(LIBFT_PATH)*.o

all: $(SERVER) $(CLIENT) libftmake

$(SERVER): ft_server.o libftmake
	gcc -o server ft_server.o -L$(LIBFT_PATH) -lft

$(CLIENT): ft_client.o libftmake
	gcc -o client ft_client.o -L$(LIBFT_PATH) -lft

libftmake:
	make -C $(LIBFT_PATH)

%.o: %.c
	gcc -c -Wall -Wextra -Werror $?

clean:
	make -C $(LIBFT_PATH) clean
	rm -f $(OBJECTS)

fclean: clean
	rm -f $(SERVER) $(CLIENT) $(LIBFT_PATH)$(LIBFT_NAME)

re: fclean all

.PHONY: all clean fclean re
