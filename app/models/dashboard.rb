class Dashboard < ApplicationRecord
   
    def self.loyal_clients
        Client
            .left_joins(:vehicles)
            .group(:id)
            .order('COUNT(vehicles.id) DESC')
            .limit(10)
    end
    #Registered ThisMonth related methods
    def self.vehicles_registered_this_month
        Vehicle.from_this_month
    end

    def self.clients_registered_this_month
        Client.from_this_month
    end

    #On-Time or Overdue related methods
    def self.services_done_on_time
        @on_time = Service.where("finish_date <= estimative")
    end

    def self.services_overdue
        @overdue = Service.where("finish_date > estimative ")
    end

    #Quantity helper methods
    def self.vehicle_quantity
        @vehicle_quantity = Vehicle.count
    end

    def self.service_quantity
        @service_quantity = Service.count
    end

    def self.client_quantity
        @client_quantity = Client.count
    end

    def self.task_quantity 
        @task_quantity = Task.count
    end

end
