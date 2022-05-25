class Client < ApplicationRecord
    has_many :vehicles, dependent: :destroy
    has_many :sales 
    validates :name, presence:true
    validates :document, presence:true, uniqueness:true
    scope :from_this_month, lambda { 
        where("clients.created_at > ? AND clients.created_at < ?", 
        Time.now.beginning_of_month, Time.now.end_of_month) }

    def self.vehicle_count
        self.vehicles.count
    end

    def loyal_client
        @client_vehicles = self.vehicles
        @services_count = 0
        
        for vehicle in @client_vehicles do
           @services_count += vehicle.services.where(:created_at => 3.months.ago..Time.now).count
        end

        if @services_count >= 2
            true
        else
            false
        end
    end


end
