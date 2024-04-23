CC ?= gcc
CFLAGS ?= -g
OBJDUMP ?= objdump
RM ?= rm

all: functest functest.asm func.o.asm functest.o.asm

functest: func.o functest.o
	${CC} $? -fno-omit-frame-pointer -o $@

%.o: %.c
	${CC} ${CFLAGS} -c $< -fno-omit-frame-pointer -o $@ -O0

%.asm: %
	${OBJDUMP} -d $< > $@

clean:
	${RM} func.o
	${RM} functest.o
	${RM} functest
	${RM} func.o.asm
	${RM} functest.o.asm
	${RM} functest.asm

