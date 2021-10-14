RISCV=/home/vagrant/tools/riscv/
CROSS=riscv64-unknown-elf-
CC=$(CROSS)gcc
OBJDUMP=$(CROSS)objdump
SPIKE=spike -m128
ifndef PROG
	$(error PROG is not set)
endif

export PATH:=$(RISCV)/bin:$(PATH)

all: $(PROG)-test $(PROG).d

$(PROG): main.c $(PROG).s
	@$(CC) -o $@ $^

$(PROG).d: $(PROG)
	@$(OBJDUMP) -d $< > $@

$(PROG)-test: $(PROG) test.txt
	@$(SPIKE) pk $(PROG)

clean:
	@rm -f $(PROG) $(PROG).d

debug: $(PROG) test.txt
	@$(SPIKE) -d pk $(PROG)


