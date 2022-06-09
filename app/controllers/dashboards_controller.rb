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

    @sale_value_this_month = Dashboard.comission_value_this_month
    @total_sales_this_month = Dashboard.total_sales_this_month
    @overdue_services = Dashboard.services_overdue.count
  end

  def client_report
    @clients = Client.all
    @clients_by_sale_total = Client.clients_by_sale

    @clients_by_sale =
      Kaminari.paginate_array(@clients_by_sale_total)
        .page(params[:page]).per(5)

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

  def part_report 
    @part_by_sale = Part.parts_by_sale_amount
  end 

  def sale_report
    @sales = Sale.all
  end

  def user_report
    @users = User.all
    @users_by_sale = User.users_by_sale
    return @users_by_sale ? @users_by_sale.length > 1 : [@users_by_sale]
  end

  def edit
    @dashboard = Dashboard.first
  end

  def show
    @comission_raw = Dashboard.first.comission_percentage
    @comission = @comission_raw / 100.0
    @dashboard = Dashboard.first
  end

  def update
    @dashboard = Dashboard.first

    if @dashboard.update(dashboard_params)
      redirect_to @dashboard
    else
      render :edit
    end
  end

  private

  def dashboard_params
    params.require(:dashboard).permit(:comission_percentage)
  end
end
