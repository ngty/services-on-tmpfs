PWD = $(shell pwd)
SCRATCH ?= /scratch
PORT ?= 5532
PGSQL_SCRATCH ?= $(SCRATCH)/pgsql
PGSQL_PORT ?= $(PORT)
PGSQL_CONFIG_TPL = $(PWD)/postgresql.conf.tpl
PGSQL_CONFIG = $(PWD)/postgresql.conf.$(PGSQL_PORT)
PGSQL_SERVER_OPTS = -D $(PGSQL_SCRATCH) -l $(PGSQL_SCRATCH)/run/log
PGSQL_CLIENT_OPTS = -h $(PGSQL_SCRATCH)/run -p $(PGSQL_PORT)

all: start

start: setup
	pg_ctl $(PGSQL_SERVER_OPTS) start

stop: 
	- pg_ctl $(PGSQL_SERVER_OPTS) stop

clean: stop
	rm -rf $(PGSQL_SCRATCH)

# import/%:
# 	[ -f "$(DUMP)" ] && \
# 		mysql -u root $(subst import/,,$@) < $(DUMP)

cli:
	psql $(PGSQL_CLIENT_OPTS) $(DB_NAME)

cli/%:
	DB_NAME=$(subst cli/,,$@) $(MAKE) cli
	
setup: $(PGSQL_SCRATCH) $(PGSQL_SCRATCH)/run $(PGSQL_SCRATCH)/postgresql.conf

$(PGSQL_SCRATCH)/postgresql.conf: $(PGSQL_CONFIG)
	cp $(PGSQL_CONFIG) $@

$(PGSQL_SCRATCH)/run:
	mkdir $@

$(PGSQL_SCRATCH):
	initdb -E UTF8 -D $(PGSQL_SCRATCH)

$(PGSQL_CONFIG):
	cat $(PGSQL_CONFIG_TPL) | sed "s|@@PORT@@|$(PGSQL_PORT)|g" | \
		sed "s|@@SCRATCH@@|$(PGSQL_SCRATCH)|g" > $@

.PHONY: $(PGSQL_CONFIG) $(PGSQL_SCRATCH)/postgresql.conf
