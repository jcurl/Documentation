struct mystruct {
	int a;
	int b;
	int c;
	int d;
	int e;
	int f;
};

int funcintr(void);
uint64_t funcint64r(void);
uint64_t funcint64r2(void);
int funcint(int a, int b, int c);
int funcchar(char a, char b);
float funcfloat(float a, float b, float c);
int funcfloatint(int a, float b, int c, float d);
double funcdouble(double a, double b);
int funcstructvalue(struct mystruct x, struct mystruct *y);
struct mystruct funcstructret(int a, int b);
int funcvarargs(int cnt, ...);
