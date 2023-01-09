/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sel-biyy <sel-biyy@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/15 19:03:45 by sel-biyy          #+#    #+#             */
/*   Updated: 2022/12/15 19:51:28 by sel-biyy         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk_bonus.h"

void	reciver(int signal)
{
	static int	bit;
	static int	i;

	if (signal == SIGUSR1)
		i = i | (0x01 << bit);
	bit++;
	if (bit == 8)
	{
		write(1, &i, 1);
		bit = 0;
		i = 0;
	}
}

int	main(int ac, char **av)
{
	int	pid;

	(void)av;
	if (ac == 1)
	{
		pid = getpid();
		ft_putnbr(pid);
		ft_putchar('\n');
		while (1)
		{
			signal(SIGUSR1, reciver);
			signal(SIGUSR2, reciver);
			pause();
		}
	}
	else
	{
		write(1, "wrong args\n", 11);
		return (0);
	}
	return (0);
}
