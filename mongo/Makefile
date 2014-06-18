PWD = $(shell pwd)
SCRATCH ?= /scratch/mongo
CONFIG = $(PWD)/mongod.conf

all: start

start: setup
	mongod -f $(CONFIG)

stop:
	- kill $(shell cat $(shell cat $(CONFIG) | grep pidfilepath | awk '{print $$3}'))

clean: stop
	rm -rf $(SCRATCH)

cli:
	mongo --host $(SCRATCH)/run/$(shell ls $(SCRATCH)/run | grep sock) $(DB_NAME)

cli/%:
	DB_NAME=$(subst cli/,,$@) $(MAKE) cli

setup: $(CONFIG) $(SCRATCH)/run

$(CONFIG):
	cat $(@).tpl | sed "s|@@SCRATCH@@|$(SCRATCH)|g" > $@

$(SCRATCH)/%:
	mkdir -p $@

.PHONY: $(CONFIG)

