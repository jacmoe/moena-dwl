# See LICENSE file for copyright and license details
# wslstatus - suckless status monitor
.POSIX:

include config.mk

REQ = util
COM =\
	components/battery\
	components/cat\
	components/cpu\
	components/datetime\
	components/disk\
	components/entropy\
	components/hostname\
	components/ip\
	components/kernel_release\
	components/keyboard_indicators\
	components/keymap\
	components/load_avg\
	components/netspeeds\
	components/num_files\
	components/ram\
	components/run_command\
	components/swap\
	components/temperature\
	components/uptime\
	components/user\
	components/volume\
	components/wifi

all: 	wslstatus

$(COM:=.o): config.mk $(REQ:=.h) wslstatus.h
wslstatus.o: wslstatus.c wslstatus.h arg.h config.h config.mk $(REQ:=.h)

.c.o:
	$(CC) -o $@ -c $(CPPFLAGS) $(CFLAGS) $<

config.h:
	cp config.def.h $@

wslstatus: wslstatus.o $(COM:=.o) $(REQ:=.o)
	$(CC) -o $@ $(LDFLAGS) $(COM:=.o) $(REQ:=.o) wslstatus.o $(LDLIBS)

clean:
	rm -f wslstatus wslstatus.o $(COM:=.o) $(REQ:=.o) wslstatus-${VERSION}.tar.gz

dist:
	rm -rf "wslstatus-$(VERSION)"
	mkdir -p "wslstatus-$(VERSION)/components"
	cp -R LICENSE Makefile README config.mk config.def.h \
	      arg.h wslstatus.h wslstatus.c $(REQ:=.c) $(REQ:=.h) \
	      wslstatus.1 "wslstatus-$(VERSION)"
	cp -R $(COM:=.c) "wslstatus-$(VERSION)/components"
	tar -cf - "wslstatus-$(VERSION)" | gzip -c > "wslstatus-$(VERSION).tar.gz"
	rm -rf "wslstatus-$(VERSION)"

install: all
	mkdir -p "$(DESTDIR)$(PREFIX)/bin"
	cp -f wslstatus "$(DESTDIR)$(PREFIX)/bin"
	chmod 755 "$(DESTDIR)$(PREFIX)/bin/wslstatus"
	mkdir -p "$(DESTDIR)$(MANPREFIX)/man1"
	cp -f wslstatus.1 "$(DESTDIR)$(MANPREFIX)/man1"
	chmod 644 "$(DESTDIR)$(MANPREFIX)/man1/wslstatus.1"

uninstall:
	rm -f "$(DESTDIR)$(PREFIX)/bin/wslstatus"
	rm -f "$(DESTDIR)$(MANPREFIX)/man1/wslstatus.1"
