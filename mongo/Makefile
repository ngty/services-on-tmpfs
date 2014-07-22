PWD = $(shell pwd)
SCRATCH ?= /scratch
MONGO_SCRATCH ?= $(SCRATCH)/mongo
PORT ?= 28017
MONGO_PORT ?= $(PORT)
CONFIG = $(PWD)/mongod.conf

all: start

start: setup
	mongod -f $(CONFIG)

stop:
	- kill $(shell cat $(shell cat $(CONFIG) | grep pidfilepath | awk '{print $$3}'))

clean: stop
	rm -rf $(MONGO_SCRATCH)

cli:
	mongo --host $(MONGO_SCRATCH)/run/$(shell ls $(MONGO_SCRATCH)/run | grep sock) $(DB_NAME)

cli/%:
	DB_NAME=$(subst cli/,,$@) $(MAKE) cli

setup: $(CONFIG) $(MONGO_SCRATCH)/run

$(CONFIG):
	cat $(@).tpl | \
		sed "s|@@PORT@@|$(MONGO_PORT)|g" | \
		sed "s|@@SCRATCH@@|$(MONGO_SCRATCH)|g" > $@

$(MONGO_SCRATCH)/%:
	mkdir -p $@

.PHONY: $(CONFIG)

