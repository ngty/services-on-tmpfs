ROOT = $(shell pwd)
SCRATCH = /scratch/mysqld
CONFIG = $(ROOT)/my.cnf
PASSWD ?= passed
CLIENT_OPTS = --defaults-file=$(CONFIG)
SERVER_OPTS = --defaults-file=$(CONFIG) --user=`whoami` --basedir=/usr --datadir=$(SCRATCH)

all: start

start: setup
	/usr/bin/mysqld_safe $(SERVER_OPTS) --no-auto-restart; sleep 5
	- $(MAKE) setup/root

stop: 
	- kill $(shell cat $(shell cat $(CONFIG) | grep pid-file | awk '{print $$3}'))

setup/root:
	mysqladmin $(CLIENT_OPTS) -u root password $(PASSWD)
	mysqladmin $(CLIENT_OPTS) -h $(shell hostname) -u root password $(PASSWD)

cli:
	mysql -h $(shell hostname) -u root --password=$(PASSWD)

cli/%:
	mysql -h $(shell hostname) -u root --password=$(PASSWD) $(subst cli/,,$@)
	
setup: $(CONFIG) $(SCRATCH) $(SCRATCH)/innodb $(SCRATCH)/run

$(SCRATCH):
	mysql_install_db $(SERVER_OPTS)

$(SCRATCH)/%:
	mkdir -p $@

$(CONFIG):
	cat $(@).tpl | sed "s|@@SCRATCH@@|$(SCRATCH)|g" > $@

.PHONY: $(CONFIG)
