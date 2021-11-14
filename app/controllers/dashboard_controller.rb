class DashboardController < ApplicationController
    def index
        @vehicles = Vehicle.all
    end

    def show
        
    end

    def client_report 

    end

    def vehicle_report
    
    end

    def service_report
        
    end
end
