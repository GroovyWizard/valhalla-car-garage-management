class DashboardsController < ApplicationController
     before_action :set_helper_dates
     
     def set_helper_dates
        @month_first_day = DateTime.now.to_date.beginning_of_month
        @month_last_day = DateTime.now.to_date.end_of_month
     end
    
     def index
        @dashboard = Dashboard.first
        @vehicles = Vehicle.last(5).reverse
        @services = Service.last(5).reverse
        @clients = Client.all
        @clients_recent = Client.last(5).reverse

        @sale_value_this_month = 300
        @total_sales_this_month = Dashboard.total_sales_this_month 
        @overdue_services = Dashboard.services_overdue.count
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

    def create 
       @dashboard = Dashboard.new(dashboard_params)
       
       if @dashboard.save 
            redirect_to action: "index"
       else 
            render :new 
       end 
    end 

    def new 
        @dashboard = Dashboard.new
    end
    
    def show
        @dashboard = Dashboard.first 
    end

    private  
        def dashboard_params
            params.require(:dashboard).permit(:comission_percentage)
        end 
    
end
