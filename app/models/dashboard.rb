class Dashboard < ApplicationRecord
  validates :comission_percentage, numericality: { less_than_or_equal_to: 100, only_integer: true }

  def self.comission
    return Dashboard.first.comission_percentage
  end

  def self.featured_user
    @all_ids = Sale.all.pluck :user_id
    @id_counter = Hash.new(0)
    
    @all_ids.each do |id|
        @id_counter[id] += 1
    end

    #order by count (reversed major to minor) then get the first entry
    #then get the id which is the first value in the entry [0] or first
    @featured_user_id = (@id_counter.sort_by { |id, count| -count }).first[0]
    @featured_user = User.find(@featured_user_id)

    return @featured_user
  end

  def self.featured_vehicles
    @vehicles = Vehicle.all
    @featured_vehicles = []

    for vehicle in @vehicles
      if vehicle.services.count > 1
        @featured_vehicles.push vehicle
      end
    end

    return @featured_vehicles.first(10)
  end

  def self.loyal_clients
    @clients = Client.all
    @loyal_clients = []

    for client in @clients
      if client.loyal_client
        @loyal_clients.push client
      end
    end
    @loyal_clients_count = @loyal_clients.count
    return @loyal_clients
  end

  #Registered ThisMonth related methods
  def self.vehicles_registered_this_month
    Vehicle.from_this_month
  end

  def self.clients_registered_this_month
    Client.from_this_month
  end

  def self.total_sales_this_month
    @sales = Sale.from_this_month
    @total = 0

    for sale in @sales
      @total += sale.value
    end

    return @total
  end

  def self.comission_value_this_month
    @sales = Sale.from_this_month
    @total = 0

    for sale in @sales
      @total += sale.comission_value
    end

    return @total
  end

  def self.sale_value_this_month
    Sale.from_this_month
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
