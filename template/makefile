all: source

clean:
	rm *.o *.lst

source: source.o ../lib.o
	ld -o source source.o ../lib.o

source.o: source.asm
	nasm -f elf64 -g -F dwarf source.asm -l source.lst

../lib.o: ../lib.asm
	nasm -f elf64 -g -F dwarf ../lib.asm -l ../source.lst
