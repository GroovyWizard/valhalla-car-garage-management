class Vehicle < ApplicationRecord
    belongs_to :client
    has_many :services
    scope :from_this_month, lambda { 
        where("vehicles.created_at > ? AND vehicles.created_at < ?", 
        Time.now.beginning_of_month, Time.now.end_of_month) }
    
    validates :model, presence: true
    validates :registration_plate, presence: true 

    def as_xls(options = {})
        {
            "Id" => id.to_s,
            "Modelo" => model,
            "Placa" => registration_plate,
            "Data de criação" => created_at,
            "Cliente" => client_id
        }
    end
    
end
