all: start

start: mysql/start mongo/start redis/start

stop: mysql/stop mongo/stop redis/stop

clean: mysql/clean mongo/clean redis/clean


mysql/%:
	$(MAKE) -C mysql $(subst mysql/,,$@)

redis/%:
	$(MAKE) -C redis $(subst redis/,,$@)

mongo/%:
	$(MAKE) -C mongo $(subst mongo/,,$@)

