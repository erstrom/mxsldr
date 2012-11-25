DESTDIR ?=
prefix ?= "/usr/local"

all: mxsldr

CFLAGS = `pkg-config --cflags libusb-1.0`
LDFLAGS = `pkg-config --libs libusb-1.0`

mxsldr: mxsldr.c
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@ -lusb-1.0

install: mxsldr
	mkdir -p $(DESTDIR)/$(prefix)/bin
	install -m 644 $^ $(DESTDIR)/$(prefix)/bin

clean:
	rm -f mxsldr
