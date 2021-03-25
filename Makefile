prefix := $(basename $(notdir $(CURDIR)))
dc := docker-compose --env-file=$(CURDIR)/.env -f phpimage/docker-compose.yml -p $(prefix)
exec := $(dc) exec
webexec := $(exec)
rwebexec := $(exec) --user root

status:
        $(dc) ps

up:
        $(dc) up -d

stop:
        $(dc) stop

down:
        $(dc) down

restart:
        $(dc) restart

sh:
        $(webexec) app /bin/sh

rsh:
        $(rwebexec) app /bin/sh

check:
        $(webexec) composer check-style
        $(webexec) composer check-smell
