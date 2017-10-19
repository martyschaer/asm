all: source

clean:
	rm *.o *.lst

source: source.o
	ld -o source source.o

source.o: source.asm
	nasm -f elf64 -g -F dwarf source.asm -l source.lst