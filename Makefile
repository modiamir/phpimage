prefix := $(basename $(notdir $(CURDIR)))
uid := $(shell id -u)
gid := $(shell id -g)
dc := docker-compose --env-file=$(CURDIR)/.env -f phpimage/docker-compose.yml -p $(prefix)
exec := $(dc) exec
webexec := $(exec)
rwebexec := $(exec) --user root

status:
	$(dc) ps

up:
	$(dc) build --build-arg PGID=$(gid) --build-arg PUID=$(uid)
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

logs:
	$(dc) logs -f --tail 100


destroy:
	$(dc) down -v --remove-orphans

amir:
	$(gid)