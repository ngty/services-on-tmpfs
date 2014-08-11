all: start

start: test/cmds mysql/start mongo/start redis/start

stop: test/cmds mysql/stop mongo/stop redis/stop

clean: test/cmds mysql/clean mongo/clean redis/clean


mysql/%: test/cmds
	$(MAKE) -C mysql $(subst mysql/,,$@)

redis/%: test/cmds
	$(MAKE) -C redis $(subst redis/,,$@)

mongo/%: test/cmds
	$(MAKE) -C mongo $(subst mongo/,,$@)


test/cmds:
	./bin/nextport

