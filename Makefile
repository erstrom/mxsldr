all: mxsldr

CFLAGS = `pkg-config --cflags libusb-1.0`

mxsldr: mxsldr.c
	$(CC) $(CFLAGS) $^ -o $@ -lusb-1.0

clean:
	rm -f mxsldr
