ROOT = $(shell pwd)
SCRATCH = /scratch/mongod
CONFIG = $(ROOT)/mongod.conf

all: start

start: setup
	mongod -f $(CONFIG)

stop:
	kill $(shell cat $(shell cat $(CONFIG) | grep pidfilepath | awk '{print $$3}'))

cli:
	mongo --host $(SCRATCH)/run/$(shell ls $(SCRATCH)/run | grep sock) $(MONGO_DB)

cli/%:
	MONGO_DB=$(subst cli/,,$@) $(MAKE) cli

setup: $(CONFIG) $(SCRATCH)/run

$(CONFIG):
	cat $(@).tpl | sed "s|@@SCRATCH@@|$(SCRATCH)|g" > $@

$(SCRATCH)/%:
	mkdir -p $@

.PHONY: $(CONFIG)

