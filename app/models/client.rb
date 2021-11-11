class Client < ApplicationRecord
    has_many :vehicles

    def self.generate_test_client
        name = Faker::Name.name
        document = Faker::Blockchain::Ethereum.address
        phone = Faker::PhoneNumber.area_code #=> "201"
        address = Faker::Address.full_address
        Client.create!(name: name, document: document, phone: phone, address: address )
    end

    def self.get_quantity
        @client_count = Client.count
    end
end
