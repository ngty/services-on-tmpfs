ROOT = $(shell pwd)
SCRATCH = /scratch/redis
CONFIG = $(ROOT)/redis.conf

all: start

start: setup
	redis-server $(CONFIG)

stop:
	- kill $(shell cat $(shell cat $(CONFIG) | grep pidfil | awk '{print $$2}'))

clean: stop
	rm -rf $(SCRATCH)

cli:
	redis-cli -s $(shell cat $(CONFIG) | grep unixsocket | head -n1 | awk '{print $$2}')

setup: $(CONFIG) $(SCRATCH)/run

$(CONFIG):
	cat $(@).tpl | sed "s|@@SCRATCH@@|$(SCRATCH)|g" > $@

$(SCRATCH)/%:
	mkdir -p $@

.PHONY: $(CONFIG)

