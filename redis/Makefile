PWD = $(shell pwd)
SCRATCH ?= /scratch
REDIS_SCRATCH ?= $(SCRATCH)/redis
PORT ?= 6479
REDIS_PORT ?= $(PORT)
CONFIG_TPL = $(PWD)/redis.conf.tpl
CONFIG = $(PWD)/redis.conf.$(REDIS_PORT)

all: start

start: setup
	redis-server $(CONFIG)

stop:
	- kill $(shell cat $(shell cat $(CONFIG) | grep pidfil | awk '{print $$2}'))

clean: stop
	rm -rf $(REDIS_SCRATCH)

cli:
	redis-cli -s $(shell cat $(CONFIG) | grep unixsocket | head -n1 | awk '{print $$2}')

setup: $(CONFIG) $(REDIS_SCRATCH)/run

$(CONFIG):
	cat $(CONFIG_TPL) | \
		sed "s|@@PORT@@|$(REDIS_PORT)|g" | \
		sed "s|@@SCRATCH@@|$(REDIS_SCRATCH)|g" > $@

$(REDIS_SCRATCH)/%:
	mkdir -p $@

.PHONY: $(CONFIG)

