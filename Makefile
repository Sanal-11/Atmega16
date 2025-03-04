# Set the microcontroller model and the toolchain
MCU = atmega16
F_CPU = 4000000  # Clock speed of the MCU
CC = avr-gcc
OBJCOPY = avr-objcopy
CFLAGS = -mmcu=$(MCU) -Os -DF_CPU=$(F_CPU) -std=c99

# Source files and output files
SRC = main.c
OBJ = $(SRC:.c=.o)
HEX = firmware.hex

# Targets
all: $(HEX)

$(HEX): $(OBJ)
	$(CC) $(CFLAGS) -o firmware.elf $(OBJ)
	$(OBJCOPY) -O ihex firmware.elf $(HEX)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o firmware.elf $(HEX)
