DESTDIR ?=
prefix ?= "/usr/local"
PKG_CONFIG ?= pkg-config

all: mxsldr

CFLAGS += $(shell $(PKG_CONFIG) --cflags libusb-1.0)
LIBS += $(shell $(PKG_CONFIG) --libs libusb-1.0)

mxsldr: mxsldr.c
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@ -lusb-1.0

install: mxsldr
	mkdir -p $(DESTDIR)/$(prefix)/bin
	install -m 755 $^ $(DESTDIR)/$(prefix)/bin

clean:
	rm -f mxsldr
