PWD = $(shell pwd)
SCRATCH ?= /scratch
SCRATCH_REDIS ?= $(SCRATCH)/redis
CONFIG = $(PWD)/redis.conf

all: start

start: setup
	redis-server $(CONFIG)

stop:
	- kill $(shell cat $(shell cat $(CONFIG) | grep pidfil | awk '{print $$2}'))

clean: stop
	rm -rf $(SCRATCH_REDIS)

cli:
	redis-cli -s $(shell cat $(CONFIG) | grep unixsocket | head -n1 | awk '{print $$2}')

setup: $(CONFIG) $(SCRATCH_REDIS)/run

$(CONFIG):
	cat $(@).tpl | sed "s|@@SCRATCH@@|$(SCRATCH_REDIS)|g" > $@

$(SCRATCH_REDIS)/%:
	mkdir -p $@

.PHONY: $(CONFIG)

