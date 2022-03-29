build: 
	@docker-compose build 

up: 
	@docker-compose up 

setup:
	@echo "Initial setup for the project"
	@docker exec -it valhalla bash -c "rails db:migrate"
	@docker exec -it valhalla bash -c "rails db:seed"

sh:
	@docker exec -it valhalla bash

seed:
	@echo "Seeding database"
	@docker exec -it valhalla bash -c "rake db:seed"

