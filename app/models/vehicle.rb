class Vehicle < ApplicationRecord
    belongs_to :client
    has_many :services
    scope :from_this_month, lambda { 
        where("vehicles.created_at > ? AND vehicles.created_at < ?", 
        Time.now.beginning_of_month, Time.now.end_of_month) }
    
    validates :model, presence: true
    validates :registration_plate, presence: true 
    
end
