CC ?= gcc
CFLAGS ?= -g
OBJDUMP ?= objdump
RM ?= rm

all: functest functest.asm func.o.asm functest.o.asm

functest: func.o functest.o
	${CC} $? -o $@

%.o: %.c
	${CC} ${CFLAGS} -c $< -o $@ -O0

%.asm: %
	${OBJDUMP} -d $< -M intel > $@

clean:
	${RM} func.o
	${RM} functest.o
	${RM} functest
	${RM} func.o.asm
	${RM} functest.o.asm
	${RM} functest.asm
