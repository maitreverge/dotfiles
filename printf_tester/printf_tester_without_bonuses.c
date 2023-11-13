/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   my_tester.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: flverge <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/09/09 12:22:09 by flverge           #+#    #+#             */
/*   Updated: 2023/11/01 08:51:36 by flverge          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
// #include "lib/libft.h"
#include <string.h>
#include <stdio.h>
// #include "lib/libft.a"
// #include "src/%c.c"
// #include "src/%s.c"
// #include "src/ft_printf.c"
// #include "src/ft_putstr.c"
// #include "src/parsing.c"
// #include "src/utils_1.c"


void	bn(void)
{
	printf("\n");
}

void displayTestSeparator(const char *text, int colorCode) // et mercé chat gpt
{
    int separatorLength = 38;  // Total length of the separator line
    int textLength = strlen(text);
    int paddingLength = separatorLength - textLength;
    int leftPadding = paddingLength / 2;
    int rightPadding = paddingLength - leftPadding;

    printf("\033[%dm\n", colorCode);  // Set the desired text color
    printf("  ///////////////////////////////////////////\n");
    printf(" //%*s%s%*s //\n", leftPadding, "", text, rightPadding, "");
    printf("///////////////////////////////////////////\n");
    printf("\033[0m\n");  // Reset text color
}

void	headings(int i)
{
	if (i == 1)
	{
		printf("\033[32;1mREAL PRINTF\033[0m\n");
		return ;
	}
	printf("\033[91;1mMY FT_PRINTF\033[0m\n");
}

void	return_values(int v_1, int v_2)
{
	bn();
    printf("\033[32;1mReturn value of REAL printf\033[0m  = %i\n", v_1);
    printf("\033[31;1mReturn value of MY ft_printf\033[0m = %i\n", v_2);
}

char test_char(char c) // function returns the next char (+1) for testing %c
{
	return (c + 1);
}

char	*test_string(char *str) // capitalize every letter
{
	int i = 0;
	if (!str)
		return (NULL);
	while (str[i])
	{
		if (str[i] >='a' && str[i] <= 'z')
			str[i] -= 32;
		i++;
	}
	return (str);
}

unsigned int		test_unsigned_int(unsigned int nb)
{
	return ((nb + 1));
}

int	test_int(int nb)
{
		return ((nb + 1));
}

// void	print_struct(t_flags s)
// {
// 	printf("placeholder = %c\n---\n", s.placeholder);
// 	printf("hashtag = %i\n---\n", s.hashtag);
// 	printf("plus_sign = %i\n---\n", s.plus_sign);
// 	printf("space = %i\n---\n", s.space);
// 	printf("minus_sign = %i\n---\n", s.minus_sign);
// 	printf("zero = %i\n---\n", s.zero);
// 	printf("point = %i\n---\n", s.point);
// 	printf("width = %i\n---\n", s.width);
// 	printf("precision = %li\n---\n", s.precision);

// }

int	main(void)
{
	// return values of both printf and ft_printf
	int	v_printf = 0;
	int	v_ftprintf = 0;
	

	// * TEST 1	
	
	displayTestSeparator("test simple string", 93);
	
	headings(1);
	v_printf = printf("This is a %% casual %% test\n");
	headings(2);
	v_ftprintf = ft_printf("This is a %% casual %% test\n");
	
	return_values(v_printf, v_ftprintf);



	// * TEST 2
	
	displayTestSeparator("test simple char", 96);

	headings(1);
	v_printf = printf("Test char : %c", 'Y');
	bn();
	headings(2);
	v_ftprintf = ft_printf("Test char : %c", 'Y');
	bn();

	return_values(v_printf, v_ftprintf);



	// * TEST 3
	
	displayTestSeparator("test multiple char", 96);

	headings(1);
	v_printf = printf("Test char : %c-%c-%c-%c", 'Y', 'M', 'C', 'A');
	bn();
	headings(2);
	v_ftprintf = ft_printf("Test char : %c-%c-%c-%c", 'Y', 'M', 'C', 'A');
	bn();
	return_values(v_printf, v_ftprintf);



	// * TEST 4
	
	displayTestSeparator("test ft char", 96);

	char value_1 = 'C';

	headings(1);
	v_printf = printf("Test char : %c-%c-%c-%c %%", test_char('X'), 'M', value_1, 'A');
	bn();
	headings(2);
	v_ftprintf = ft_printf("Test char : %c-%c-%c-%c %%", test_char('X'), 'M', value_1, 'A');
	bn();
	return_values(v_printf, v_ftprintf);

	
	// * TEST 5
	
	displayTestSeparator("test string", 92);

	headings(1);
	v_printf = printf("Test string : %s", "Hello, World !");
	bn();
	headings(2);
	v_ftprintf = ft_printf("Test string : %s", "Hello, World !");
	bn();

	return_values(v_printf, v_ftprintf);



	// * TEST 6
	
	displayTestSeparator("test multiple strings", 92);
	
	char str[] = "thIs senTence ouTput iS SUPosED to Be alL CAps";
	
	headings(1);
	v_printf = printf("Test string : %s\n%s\n%s", "Hello, World !", "Life is potatoes", test_string(str));
	bn();
	headings(2);
	v_ftprintf = ft_printf("Test string : %s\n%s\n%s", "Hello, World !", "Life is potatoes", test_string(str));
	bn();

	return_values(v_printf, v_ftprintf);



	// * TEST 7
	
	displayTestSeparator("combo_previous placeholders", 92);

	headings(1);
	v_printf = printf("String = %s__char : %c.___%%%%%%", "Hello, World !", 'C');
	bn();
	headings(2);
	v_ftprintf = ft_printf("String = %s__char : %c.___%%%%%%", "Hello, World !", 'C');
	bn();

	return_values(v_printf, v_ftprintf);



	// * TEST 8
	
	displayTestSeparator("Test empty string", 92);

	char *empty = NULL;

	headings(1);
	v_printf = printf("String = %s", empty);
	bn();
	headings(2);
	v_ftprintf = ft_printf("String = %s", empty);
	bn();

	return_values(v_printf, v_ftprintf);



	// * TEST 9
	
	displayTestSeparator("Test %p adresses", 91);

	char *pointer_test = "test";

	headings(1);
	v_printf = printf("Adress = %p", &pointer_test);
	bn();
	headings(2);
	v_ftprintf = ft_printf("Adress = %p", &pointer_test);
	bn();

	return_values(v_printf, v_ftprintf);

		// * TEST 10
	
	displayTestSeparator("Test empty adress", 91);

	headings(1);
	v_printf = printf("Adress = %p", (void*)-1);
	bn();
	headings(2);
	v_ftprintf = ft_printf("Adress = %p", (void*)-1);
	bn();

	return_values(v_printf, v_ftprintf);

		// * TEST 11
	displayTestSeparator("Test null", 91);

	headings(1);
	v_printf = printf("Adress = %p", 0);
	bn();
	headings(2);
	v_ftprintf = ft_printf("Adress = %p", 0);
	bn();

	return_values(v_printf, v_ftprintf);

	
	// * TEST 12
	displayTestSeparator("Test %u positive int", 95);

	headings(1);
	v_printf = printf("%u", 42);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%u", 42);
	bn();

	return_values(v_printf, v_ftprintf);

	// * TEST 13

	displayTestSeparator("Test %u int_max", 95);

	headings(1);
	v_printf = printf("%u", FT_INT_MAX);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%u", FT_INT_MAX);
	bn();

	return_values(v_printf, v_ftprintf);


	// * TEST 14

	displayTestSeparator("Test %u null int", 95);

	headings(1);
	v_printf = printf("%u", 0);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%u", 0);
	bn();

	return_values(v_printf, v_ftprintf);

	// * TEST 15

	displayTestSeparator("Test %u return ft int", 95);

	headings(1);
	v_printf = printf("%u", test_unsigned_int(42));
	bn();
	headings(2);
	v_ftprintf = ft_printf("%u", test_unsigned_int(42));
	bn();

	return_values(v_printf, v_ftprintf);

	// * TEST 16

	displayTestSeparator("Test %u beyond int max", 95);

	headings(1);
	v_printf = printf("%u", 2148000000);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%u", 2148000000);
	bn();

	return_values(v_printf, v_ftprintf);

	// * TEST 17

	displayTestSeparator("Test %i int positive", 92);

	headings(1);
	v_printf = printf("%i", 42);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%i", 42);
	bn();

	return_values(v_printf, v_ftprintf);

	// * TEST 18

	displayTestSeparator("Test %i int negative", 92);

	headings(1);
	v_printf = printf("%i", -42);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%i", -42);
	bn();

	return_values(v_printf, v_ftprintf);

	// * TEST 19

	displayTestSeparator("Test %i int null", 92);

	headings(1);
	v_printf = printf("%i", 0);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%i", 0);
	bn();

	return_values(v_printf, v_ftprintf);

	
	// * TEST 20

	displayTestSeparator("Test %i int max", 92);

	headings(1);
	v_printf = printf("%i", FT_INT_MAX);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%i", FT_INT_MAX);

	return_values(v_printf, v_ftprintf);

	
	// * TEST 21

	displayTestSeparator("Test %i int min", 92);

	headings(1);
	v_printf = printf("%i", FT_INT_MIN);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%i", FT_INT_MIN);

	return_values(v_printf, v_ftprintf);

	// * TEST 22

	displayTestSeparator("Test %i int multiples", 92);

	headings(1);
	v_printf = printf("%i%i%i%i%i%i%i", 10, 23, -2, 37, 200, -9999, 977779);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%i%i%i%i%i%i%i", 10, 23, -2, 37, 200, -9999, 977779);
	
	return_values(v_printf, v_ftprintf);


	// * TEST 23

	displayTestSeparator("Test %x hexa number", 96);

	headings(1);
	v_printf = printf("%x", 4251);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%x", 4251);
	
	return_values(v_printf, v_ftprintf);

	// * TEST 24

	displayTestSeparator("Test %x other value hexa number", 96);

	headings(1);
	v_printf = printf("%x", 10);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%x", 10);
	
	return_values(v_printf, v_ftprintf);

		// * TEST 25

	displayTestSeparator("Test %x null hexa number", 96);

	headings(1);
	v_printf = printf("%x", 0);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%x", 0);
	
	return_values(v_printf, v_ftprintf);

		// * TEST 26

	displayTestSeparator("Test %x int_max hexa number", 96);

	headings(1);
	v_printf = printf("%x", FT_INT_MAX);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%x", FT_INT_MAX);
	
	return_values(v_printf, v_ftprintf);


		// * TEST 27.1

	displayTestSeparator("Test %x shitty hexa number", 96);

	headings(1);
	v_printf = printf("%x", 3735929054u);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%x", 3735929054u);
	
	return_values(v_printf, v_ftprintf);

		// * TEST 27.2

	displayTestSeparator("Test %x neg hexa number", 96);

	headings(1);
	v_printf = printf("%x", -1);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%x", -1);
	
	return_values(v_printf, v_ftprintf);

	///////////////////////////

	// * TEST 28

	displayTestSeparator("Test %X hexa number", 93);

	headings(1);
	v_printf = printf("%X", 4251);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%X", 4251);
	
	return_values(v_printf, v_ftprintf);

	// * TEST 29

	displayTestSeparator("Test %X other hexa number", 93);

	headings(1);
	v_printf = printf("%X", 10);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%X", 10);
	
	return_values(v_printf, v_ftprintf);

		// * TEST 30

	displayTestSeparator("Test %X null hexa number", 93);

	headings(1);
	v_printf = printf("%X", 0);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%X", 0);
	
	return_values(v_printf, v_ftprintf);

		// * TEST 31

	displayTestSeparator("Test %X int_max hexa number", 93);

	headings(1);
	v_printf = printf("%X", FT_INT_MAX);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%X", FT_INT_MAX);
	
	return_values(v_printf, v_ftprintf);


		// * TEST 32.1

	displayTestSeparator("Test %X shitty hexa number", 93);

	headings(1);
	v_printf = printf("%X", 3735929054u);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%X", 3735929054u);
	
	return_values(v_printf, v_ftprintf);

		// * TEST 32.2

	displayTestSeparator("Test %X shitty hexa number", 93);

	headings(1);
	v_printf = printf("%X", -1);
	bn();
	headings(2);
	v_ftprintf = ft_printf("%X", -1);
	
	return_values(v_printf, v_ftprintf);
}