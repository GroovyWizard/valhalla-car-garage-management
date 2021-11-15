class DashboardController < ApplicationController
    def index
        @vehicles = Vehicle.all
    end

    def show
        
    end

    def self.client_report 
        @clients = Client.all
        @loyal_clients = Dashboard.get_loyal_clients
    end

    def vehicle_report
        @vehicles = Vehicle.all
    end

    def service_report
        @services = Service.all
        @on_time = Dashboard.get_done_on_time
        @overdue = Dashboard.get_overdue
    end
    
end
