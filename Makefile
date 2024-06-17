all: a.out

a.out:
	vasm -Fbin -L a.lst -dotdir test.asm

.PHONY: view
view:
	hexdump -C a.out

.PHONY: clean
clean:
	rm -Rf a.out
