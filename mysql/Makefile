PWD = $(shell pwd)
SCRATCH ?= /scratch
MYSQL_SCRATCH ?= $(SCRATCH)/mysql
PORT ?= 3406
MYSQL_PORT ?= $(PORT)
CONFIG = $(PWD)/my.cnf
CLIENT_OPTS = --defaults-file=$(CONFIG)
SERVER_OPTS = --defaults-file=$(CONFIG) --user=`whoami` --basedir=/usr --datadir=$(MYSQL_SCRATCH)

all: start

start: setup
	/usr/bin/mysqld_safe $(SERVER_OPTS) --no-auto-restart

stop: 
	- kill $(shell cat $(shell cat $(CONFIG) | grep pid-file | awk '{print $$3}'))

clean: stop
	rm -rf $(MYSQL_SCRATCH)

import/%:
	[ -f "$(DUMP)" ] && \
		mysql -u root $(subst import/,,$@) < $(DUMP)

cli:
	mysql -h $(shell hostname) -u root $(DB_NAME)

cli/%:
	DB_NAME=$(subst cli/,,$@) $(MAKE) cli
	
setup: $(CONFIG) $(MYSQL_SCRATCH)

$(MYSQL_SCRATCH): $(MYSQL_SCRATCH)/innodb $(MYSQL_SCRATCH)/run
	mysql_install_db $(SERVER_OPTS)

$(MYSQL_SCRATCH)/%:
	mkdir -p $@

$(CONFIG):
	cat $(@).tpl | sed "s|@@PORT@@|$(MYSQL_PORT)|g" | \
		sed "s|@@SCRATCH@@|$(MYSQL_SCRATCH)|g" > $@

.PHONY: $(CONFIG)
