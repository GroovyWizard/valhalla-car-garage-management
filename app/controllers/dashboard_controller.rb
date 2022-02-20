class DashboardController < ApplicationController
     before_action :set_helper_dates
     
     def set_helper_dates
        @month_first_day = DateTime.now.to_date.beginning_of_month
        @month_last_day = DateTime.now.to_date.end_of_month
     end
    
     def index
        @vehicles = Vehicle.last(5).reverse
        @services = Service.last(5).reverse
        @clients = Client.all
        @clients_recent = Client.last(5).reverse

        @clients_this_month = Dashboard.clients_registered_this_month.count
        @vehicles_this_month = Dashboard.vehicles_registered_this_month.count
        
        @overdue_services = Dashboard.services_overdue.count
        @on_time_services = Dashboard.services_done_on_time.count
    end

    def client_report 
        @clients = Client.all
        @clients_this_month = Dashboard.clients_registered_this_month
        @loyal_clients = Dashboard.loyal_clients
        @loyal_clients_count = @loyal_clients.count
    end

    def vehicle_report
        @vehicles = Vehicle.all
        @vehicles_this_month = Dashboard.vehicles_registered_this_month
        @featured_vehicles = Dashboard.featured_vehicles
    end

    def service_report
        @services = Service.all
        @overdue_services = Dashboard.services_overdue
        @on_time_services = Dashboard.services_done_on_time
    end
    
end
