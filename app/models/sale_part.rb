class SalePart < ApplicationRecord
    belongs_to :part 
    belongs_to :sale

    after_save :update_sale_value
    
    def update_sale_value
        if self.sale and self.part  
            self.sale.synchronize_total_value
        end 
    end 
end
