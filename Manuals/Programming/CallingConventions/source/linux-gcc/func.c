#include <stdlib.h>
#include <stdint.h>
#include <stdarg.h>
#include "func.h"

int funcintr(void)
{
	return 42;
}

uint64_t funcint64r(void)
{
	return 0x4200000000;
}

uint64_t funcint64r2(void)
{
	return 42;
}

int funcint(int a, int b, int c)
{
	return (a + 1) * (b + 2) * (c + 3);
}

int funcchar(char a, char b)
{
	return (a + 1) * (b + 2);
}

float funcfloat(float a, float b, float c)
{
	return (a + 1.0) * (b + 2.0) * (c + 3.0);
}

int funcfloatint(int a, float b, int c, float d)
{
	return (a + 1) * (b + 2.0) * (c + 3) * (d + 4.0);
}

double funcdouble(double a, double b)
{
	return (a + 2) * (b + 4);
}

int funcstructvalue(struct mystruct x, struct mystruct *y)
{
	return x.a + y->b;
}

struct mystruct funcstructret(int a, int b)
{
	struct mystruct r = {0, };
	r.a = a;
	r.b = b;
	return r;
}

int funcvarargs(int cnt, ...)
{
	va_list argptr;
	va_start(argptr, cnt);
	int i, j = 0;
	
	for (i = 0; i < cnt; i++) j += va_arg(argptr, int);
	return j;
}