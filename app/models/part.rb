class Part < ApplicationRecord
    belongs_to :sale, optional: true  

    validates :name, presence: true
    validates :value, presence: true
    
    after_initialize :set_defaults
    after_save :update_sale_value

    def update_sale_value
        if self.sale 
            self.sale.synchronize_total_value
        end 
    end

    def set_defaults
      self.value ||= 0.0
      self.sold ||= false
    end
    

    def sold_parsed
        if sold == true 
            return "Vendida"
        else 
            return "Disponivel"
        end
    end 
end
