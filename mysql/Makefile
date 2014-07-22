PWD = $(shell pwd)
SCRATCH ?= /scratch
SCRATCH_MYSQL ?= $(SCRATCH)/mysql
CONFIG = $(PWD)/my.cnf
PORT ?= 3306
CLIENT_OPTS = --defaults-file=$(CONFIG)
SERVER_OPTS = --defaults-file=$(CONFIG) --user=`whoami` --basedir=/usr --datadir=$(SCRATCH_MYSQL)

all: start

start: setup
	/usr/bin/mysqld_safe $(SERVER_OPTS) --no-auto-restart

stop: 
	- kill $(shell cat $(shell cat $(CONFIG) | grep pid-file | awk '{print $$3}'))

clean: stop
	rm -rf $(SCRATCH_MYSQL)

import/%:
	[ -f "$(DUMP)" ] && \
		mysql -u root $(subst import/,,$@) < $(DUMP)

cli:
	mysql -h $(shell hostname) -u root $(DB_NAME)

cli/%:
	DB_NAME=$(subst cli/,,$@) $(MAKE) cli
	
setup: $(CONFIG) $(SCRATCH_MYSQL)

$(SCRATCH_MYSQL): $(SCRATCH_MYSQL)/innodb $(SCRATCH_MYSQL)/run
	mysql_install_db $(SERVER_OPTS)

$(SCRATCH_MYSQL)/%:
	mkdir -p $@

$(CONFIG):
	cat $(@).tpl | sed "s|@@PORT@@|$(PORT)|g" | \
		sed "s|@@SCRATCH@@|$(SCRATCH_MYSQL)|g" > $@

.PHONY: $(CONFIG)
