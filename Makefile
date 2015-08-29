all: start

start: test/cmds mysql/start mongo/start redis/start pgsql/start

stop: test/cmds mysql/stop mongo/stop redis/stop pgsql/stop

clean: test/cmds mysql/clean mongo/clean redis/clean pgsql/clean


mysql/%: test/cmds
	$(MAKE) -C mysql $(subst mysql/,,$@)

pgsql/%: test/cmds
	$(MAKE) -C pgsql $(subst pgsql/,,$@)

redis/%: test/cmds
	$(MAKE) -C redis $(subst redis/,,$@)

mongo/%: test/cmds
	$(MAKE) -C mongo $(subst mongo/,,$@)


test/cmds:
	./bin/nextport

