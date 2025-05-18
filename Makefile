all:
	docker-compose up -d

down:
	docker-compose down
	
clean:
	docker-compose down --rmi all

run:
	docker exec -it hadoop bash