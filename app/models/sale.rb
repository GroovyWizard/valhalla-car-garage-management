class Sale < ApplicationRecord
  has_many :sale_part  
  has_many :parts, through: :sale_part
   
    belongs_to :service, optional: true    
    
    after_initialize :set_defaults
    
    def set_defaults
      self.value ||= 0.0
    end

    def synchronize_total_value
        if self.parts.count > 0 
         self.value = SaleValueUpdater.calculate_total_value(self) 
        else 
          puts("Error")
        end 
    end 
end
