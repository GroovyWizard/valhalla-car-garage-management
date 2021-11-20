class Client < ApplicationRecord
    has_many :vehicles
    scope :from_this_month, lambda { 
        where("clients.created_at > ? AND clients.created_at < ?", 
        Time.now.beginning_of_month, Time.now.end_of_month) }

    def self.generate_test_client
        name = Faker::Name.name
        document = Faker::CPF.pretty
        phone = Faker::PhoneNumber.area_code #=> "201"
        address = Faker::Address.full_address
        Client.create!(name: name, document: document, phone: phone, address: address )
    end

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
