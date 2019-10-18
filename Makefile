CROSS := aarch64-linux-gnu

CURRENT_DIR := $(CURDIR)

AS = $(CROSS)-as
LD = $(CROSS)-ld
OBJDUMP = $(CROSS)-objdump
OBJCOPY = $(CROSS)-objcopy

AFLAGS = -g3

all: kernel8.img

boot.o: boot.S
	$(AS) $(AFLAGS) $< -o $@

kernel8.elf : memmap boot.o
	$(LD) boot.o -T memmap -o kernel8.elf

kernel8.img : kernel8.elf
	$(OBJCOPY) $< -O binary kernel8.img

.PHONY: qemu
qemu: kernel8.elf
	qemu-system-aarch64 -M arm-generic-fdt \
		-nographic \
		-serial mon:stdio \
		-dtb //var/dts/LATEST/SINGLE_ARCH/zcu102-arm.dtb \
		-device loader,file=./kernel8.elf,cpu-num=0 \
		-device loader,addr=0xfd1a0104,data=0x8000000e,data-len=4 -s -S

.PHONY: debug
debug: kernel8.elf
	gdb-multiarch -q --eval-command="target remote localhost:1234" ./kernel8.elf

.PHONY: clean
clean:
	rm -rf *.o *.elf *.img


