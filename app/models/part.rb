class Part < ApplicationRecord
    belongs_to :service   
    belongs_to :sale 

    validates :name, presence: true
    validates :value, presence: true
    validates :sold, presence: true
    validates :stock, presence: true
   
    after_initialize :set_defaults

    def set_defaults
      self.value ||= 0.0
      self.sold ||= false
      self.stock ||= 0
    end
    

    def sold_parsed
        if sold == true 
            return "Vendida"
        else 
            return "Disponivel"
        end
    end 
end
