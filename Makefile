SRC = server.c minitalkutils.c
SRC1 = client.c minitalkutils.c
SRC_B = server_bonus.c minitalkutils_bonus.c
SRC1_B = client_bonus.c minitalkutils_bonus.c
OBJFILES = $(SRC:.c=.o)
OBJFILES1 = $(SRC1:.c=.o)
OBJFILES_B = $(SRC_B:.c=.o)
OBJFILES1_B= $(SRC1_B:.c=.o)
CFLAGS = -Wall -Werror -Wextra
NAME = server
NAME1 = client
NAME_B = server_bonus
NAME1_B = client_client

all: $(NAME) $(NAME1)
bonus:    $(NAME_B) $(NAME1_B)

$(NAME): $(OBJFILES)
	cc $(CFLAGS) $(OBJFILES) -o $(NAME)

$(NAME1): $(OBJFILES1)
	cc $(CFLAGS) $(OBJFILES1) -o $(NAME1)

$(NAME_B): $(OBJFILES_B)
	cc $(CFLAGS) $(OBJFILES_B) -o $(NAME_B)
	
$(NAME1_B): $(OBJFILES1_B)
	cc $(CFLAGS) $(OBJFILES1_B) -o $(NAME1_B)

clean:
	rm -rf $(OBJFILES) $(OBJFILES1) $(OBJFILES_B) $(OBJFILES1_B)


fclean: clean
	rm -rf $(NAME) $(NAME1) $(NAME_B) $(NAME1_B)
re:fclean all