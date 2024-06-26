# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/23 08:53:52 by lfiorini          #+#    #+#              #
#    Updated: 2023/02/02 18:27:51 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC		=	cc

NAME	=	libftprintf.a

CFLAGS	=	-Wall -Wextra -Werror

LIBFT	=	libft

HDRS	=	./

SRCS	:=	ft_printf.c ft_printf_utils.c print_chars.c \
			print_digits.c ft_parser.c ft_converter.c ft_printf_bonus.c
OBJS	=	$(SRCS:.c=.o)

RM		=	rm -f

all:	$(NAME)

$(NAME):	$(OBJS)
		make -C $(LIBFT)
		cp libft/libft.a ./$(NAME)
		ar	rcs	$(NAME)	$?

bonus: $(NAME)

.c.o:
		$(CC) $(CFLAGS) -I $(HDRS) -c $< -o $(<:.c=.o)

clean:
		$(RM) $(OBJS)
		make clean -C $(LIBFT)

fclean:	clean
		$(RM) $(NAME)
		make fclean -C $(LIBFT)

re:		fclean all

.PHONY:	all clean fclean re
