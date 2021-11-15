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
end
