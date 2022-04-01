class Sale < ApplicationRecord
    has_many :parts
    belongs_to :service, optional: true    
    
    after_initialize :set_defaults
    
    def set_defaults
      self.value ||= 0.0
    end

    def synchronize_total_value
        self.value = SaleValueUpdater.calculate_total_value(self) 
    end 
end
