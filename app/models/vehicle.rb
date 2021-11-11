class Vehicle < ApplicationRecord
    belongs_to :client
    has_many :services
    
    validates :model, presence: true
    validates :registration_plate, presence: true 
    
    def self.get_quantity
        @vehicle_count = Vehicle.count
    end

end
