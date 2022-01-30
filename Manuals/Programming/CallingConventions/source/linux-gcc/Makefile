all: functest func.asm functest.asm

functest: func.o functest.o
	gcc func.o functest.o -o functest
	
func.o: func.c
	gcc -g -c func.c -o func.o -O0
	
functest.o: functest.c
	gcc -g -c functest.c -o functest.o -O0

func.asm: func.o
	objdump -d func.o -M intel > func.asm

functest.asm: functest.o
	objdump -d functest.o -M intel > functest.asm
	
clean:
	rm func.o
	rm functest.o
	rm functest
	rm func.asm
	rm functest.asm
	