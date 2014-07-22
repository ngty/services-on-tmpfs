PWD = $(shell pwd)
SCRATCH ?= /scratch
SCRATCH_MONGO ?= $(SCRATCH)/mongo
CONFIG = $(PWD)/mongod.conf

all: start

start: setup
	mongod -f $(CONFIG)

stop:
	- kill $(shell cat $(shell cat $(CONFIG) | grep pidfilepath | awk '{print $$3}'))

clean: stop
	rm -rf $(SCRATCH_MONGO)

cli:
	mongo --host $(SCRATCH_MONGO)/run/$(shell ls $(SCRATCH_MONGO)/run | grep sock) $(DB_NAME)

cli/%:
	DB_NAME=$(subst cli/,,$@) $(MAKE) cli

setup: $(CONFIG) $(SCRATCH_MONGO)/run

$(CONFIG):
	cat $(@).tpl | sed "s|@@SCRATCH@@|$(SCRATCH_MONGO)|g" > $@

$(SCRATCH_MONGO)/%:
	mkdir -p $@

.PHONY: $(CONFIG)

