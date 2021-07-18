D-COMP=srcs/docker-compose.yml
D-CMD=docker-compose -f $(D-COMP)

.PHONY:	all up stop down start re

all:	up

re:		stop up

up:
	mkdir -p /home/trachell/data/db
	mkdir -p /home/trachell/data/wp
	$(D-CMD) up -d --build

stop:
	$(D-CMD) stop

down:
	$(D-CMD) down --rmi all -v

clean: 	down
	sh ./srcs/requirements/tools/rm.sh

start:
	$(D-CMD) start