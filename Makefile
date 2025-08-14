COMPOSE_FILE = ./srcs/docker-compose.yml

all : up

up :
	docker compose -f $(COMPOSE_FILE) up -d --build

start :
	docker compose -f $(COMPOSE_FILE) up -d

start_only :
	docker compose -f $(COMPOSE_FILE) start

stop :
	docker compose -f $(COMPOSE_FILE) stop

down :
	docker compose -f $(COMPOSE_FILE) down

clean:
	docker compose -f $(COMPOSE_FILE) down --rmi all

fclean:
	docker compose -f $(COMPOSE_FILE) down -v --rmi all

re: fclean all
