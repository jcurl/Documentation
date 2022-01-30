#include <stdlib.h>
#include <stdint.h>
#include "func.h"

int test_funcintr(void)
{
	int a;
	a = funcintr() + 1;
	return a;
}

int test_funcint64r(void)
{
	uint64_t a;
	a = funcint64r() + 1;
	return (int)a;
}

int test_funcint64r2(void)
{
	uint64_t a;
	a = funcint64r2() + 1;
	return (int)a;
}

int test_funcint(void)
{
	int a;
	a = funcint(1, 2, 3) + 1;
	return a;
}

int test_funcchar(void)
{
	int a;
	a = funcchar(1, 2) + 1;
	return a;
}

int test_funcfloat(void)
{
	float a;
	a = funcfloat(1.0, 2.0, 3.0) + 4.0;
	return (int)a;
}

int test_funcfloatint(void)
{
	int a;
	a = funcfloatint(1, 2.0, 3, 4.0) + 1;
	return a;
}

int test_funcdouble(void)
{
	double a;
	a = funcdouble(2.0, 4.0) + 1.0;
	return (int)a;
}

int test_funcstructvalue(void)
{
	struct mystruct x = {1, 2, 3, 4, 5, 6};
	struct mystruct y = {0, };

	int a;
	a = funcstructvalue(x, &y) + 1;
	return a;
}

int test_funcstructret(void)
{
	struct mystruct x;
	x = funcstructret(1, 2);
	return x.a;
}

int test_funcvarargs1(void)
{
	int a;
	a = funcvarargs(1) + 1;
	return a;
}

int test_funcvarargs4(void)
{
	int a;
	a = funcvarargs(4, 1, 2, 3, 4) + 1;
	return a;
}

int test_funcvarargs6(void)
{
	int a;
	a = funcvarargs(6, 2, 4, 6, 8, 10, 12) + 1;
	return a;
}



int main(void)
{
	int v = 0;
	v += test_funcintr();
	v += test_funcint64r();
	v += test_funcint64r2();
	v += test_funcint();
	v += test_funcchar();
	v += test_funcfloat();
	v += test_funcfloatint();
	v += test_funcdouble();
	v += test_funcstructvalue();
	v += test_funcstructret();
	v += test_funcvarargs1();
	v += test_funcvarargs4();
	v += test_funcvarargs6();
}

