all: main.out

main.out:
	vasm -Fbin -L main.lst -dotdir -o main.out main.asm

.PHONY: view
view:
	hexdump -C main.out

.PHONY: clean
clean:
	rm -Rf main.out
