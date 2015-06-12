#!/usr/bin/make -f
# -*- makefile -*-

default: all
all: man/writeboost.8

man/writeboost.8:
	pod2man -s8 --stderr --utf8 sbin/writeboost $@ || rm -fv $@

clean:
	rm -fv man/writeboost.8

#install: all
#	install --preserve-timestamps --verbose
