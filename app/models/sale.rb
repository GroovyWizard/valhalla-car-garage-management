class Sale < ApplicationRecord
    has_many :sale_part  
    has_many :parts, through: :sale_part
    
    belongs_to :client, optional: true
    belongs_to :service, optional: true    
    
    after_initialize :set_defaults
    after_initialize :received_part_ids
    after_initialize :synchronize_total_value 
    
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
    
    def received_part_ids
      if self.part_ids
        self.part_ids << Part.where(id: [part_ids])
      end 
    end

end
