#include <stdio.h>
#include <unistd.h>
#include <string.h>


size_t	_ft_write(int fd, const void *buf, size_t size);
size_t	_ft_read(int fd, void *buf, size_t count);
size_t	_ft_strlen(const char *s);
char 		*_ft_strdup(const char *s);
int			_ft_strcmp(const char *s1, const char *s2);
char		*_ft_strcpy(char *dest, const char *src);


int main(int argc, char **argv)
{
	char buf[5000];
	char *tmp;
	int bytes = 0;

	if (argc != 2)
	{
		_ft_write(1, "needs one string argument\n", _ft_strlen("needs two string arguments\n"));
		return (1);
	}
	strcat(argv[1], "\n");
	_ft_write(1, argv[1], _ft_strlen(argv[1]));
	printf("Type a thing:\n");
	bytes = _ft_read(0, buf, 5000);
	buf[bytes] = '\0';
	printf("%s", buf);
	tmp = _ft_strdup(buf);
	printf("here's how it compares to the arg:%d\n", _ft_strcmp(argv[1], tmp));
	
	return (0);
}
