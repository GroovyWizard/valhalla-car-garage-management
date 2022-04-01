build: 
	@docker-compose build 

up: 
	@docker-compose up -d

up-int:
	@docker-compose up

down:
	@docker-compose down

setup:
	@echo "Initial setup for the project"
	@docker exec valhalla bash -c "bundle install"
	@docker exec valhalla bash -c "rails db:migrate"
	@docker exec valhalla bash -c "rails db:seed"

sh:
	@docker exec -it valhalla bash

seed:
	@echo "Seeding database"
	@docker exec valhalla bash -c "rake db:seed"

gem-sync: 
	@echo "Updating gems"
	@docker exec valhalla bash -c "bundle install"

reset:
	@echo "Resetting database"
	@docker exec valhalla bash -c "rake db:reset"
	@docker exec valhalla bash -c "rails db:migrate"
	@docker exec valhalla bash -c "rails db:seed"