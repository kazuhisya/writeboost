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

.PHONY: test test_man
test: test_man
	sh -n sbin/writeboost

test_man: man/writeboost.8
	@for M in writeboost.8 writeboosttab.5; do \
            echo "Checking $$M" ;\
            lexgrog "man/$$M" || break  ;\
            W=$$(man --warnings -E UTF-8 -l -Tutf8 -Z "man/$$M" 2>&1 >>/dev/null) ;\
            if [ -n "$$W" ]; then echo "$$W"; break; fi ;\
        done
