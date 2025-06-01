

CPU = cortex-m3
BOARD = stm32vldiscovery

all:

qemu:
	arm-none-eabi-as -mcpu=$(CPU) -mthumb -ggdb -c foo.s -o foo.o
	arm-none-eabi-ld -Tmap.ld foo.o -o foo.elf
	arm-none-eabi-objcopy -O binary foo.elf foo.bin
	qemu-system-arm -S -M $(BOARD) -cpu $(CPU) -nographic -kernel foo.elf -gdb tcp::1234

gdb:
	gdb-multiarch -q foo.elf -ex "target remote localhost:1234"

dump:
	xxd foo.bin | less

clean:
	rm -rf *.elf *.o *.bin