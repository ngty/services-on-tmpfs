all: start

start: mysql/start mongo/start

stop: mysql/stop mongo/stop


mysql/%:
	$(MAKE) -C mysql $(subst mysql/,,$@)

mongo/%:
	$(MAKE) -C mongo $(subst mongo/,,$@)

