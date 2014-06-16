ROOT = $(shell pwd)
SCRATCH = /scratch/mysqld
CONFIG = $(ROOT)/my.cnf
CLIENT_OPTS = --defaults-file=$(CONFIG)
SERVER_OPTS = --defaults-file=$(CONFIG) --user=`whoami` --basedir=/usr --datadir=$(SCRATCH)

all: start

start: setup
	/usr/bin/mysqld_safe $(SERVER_OPTS) --no-auto-restart

stop: 
	- kill $(shell cat $(shell cat $(CONFIG) | grep pid-file | awk '{print $$3}'))

cli:
	mysql -h $(shell hostname) -u root $(DB_NAME)

cli/%:
	DB_NAME=$(subst cli/,,$@) $(MAKE) cli
	
setup: $(CONFIG) $(SCRATCH) $(SCRATCH)/innodb $(SCRATCH)/run

$(SCRATCH):
	mysql_install_db $(SERVER_OPTS)

$(SCRATCH)/%:
	mkdir -p $@

$(CONFIG):
	cat $(@).tpl | sed "s|@@SCRATCH@@|$(SCRATCH)|g" > $@

.PHONY: $(CONFIG)
