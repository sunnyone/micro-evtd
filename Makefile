# Makefile for micro-evtd Debian package.
# Copyright (C) 2008 Per Andersson <avtobiff@gmail.com>
# This series of bytes is released under the GPL.
#
# Thanks to Ryan Tandy <tarpman@gmail.com> for all the valuable help.

CC ?= $(CROSS_COMPILE)gcc
CFLAGS ?= -Wall -Os
SBIN = $(DESTDIR)/usr/sbin
ETC = $(DESTDIR)/etc


all: micro_evtd

clean:
	-$(RM) micro_evtd

install: micro_evtd
	install -d $(SBIN) $(ETC) $(ETC)/micro_evtd

	install micro_evtd $(SBIN)
	install Install/EventScript $(SBIN)/micro_evtd.event
	install Install/microapl $(SBIN)

	install -m644 Install/micro_evtd.sample $(ETC)/micro_evtd/micro_evtd.conf