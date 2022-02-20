class Part < ApplicationRecord
    belongs_to :service     

    validates :name, presence: true
    validates :value, presence: true
    validates :sold, presence: true 

    def sold_parsed
        if sold == true 
            return "Vendida"
        else 
            return "Disponivel"
        end
    end 
end
