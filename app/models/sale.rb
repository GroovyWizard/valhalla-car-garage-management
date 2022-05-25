class Sale < ApplicationRecord
    has_many :sale_part  
    has_many :parts, through: :sale_part
    
    belongs_to :client, optional: true
    belongs_to :service, optional: true    
    belongs_to :user 

    after_initialize :set_defaults
    after_initialize :received_part_ids
    after_initialize :received_relation_with_parent_model
    after_initialize :synchronize_total_value 
    after_initialize :calculate_comission 
    before_save :infer_sale_name 
    scope :from_this_month, lambda { 
      where("sales.created_at > ? AND sales.created_at < ?", 
      Time.now.beginning_of_month, Time.now.end_of_month) }


    def set_defaults
      self.value ||= 0.0
    end
    
    def calculate_comission  
        comission_percentage = Dashboard.comission ? Dashboard.comission : 0.0 
        self.comission_value = comission_percentage / 100.0 * self.value
    end 

    def synchronize_total_value
        if self.parts.count > 0 
         self.value = SaleValueUpdater.calculate_total_value(self) 
        end 
    end
    
    def received_part_ids
      if self.part_ids
        self.part_ids << Part.where(id: [part_ids])
      end 
    end
    
    def received_relation_with_parent_model
      if self.service_id != "Selecione" && self.service_id  
        self.service = Service.find(service_id)
      elsif self.client_id != "Selecione" && self.client_id 
        self.client = Client.find(client_id)
      end 
    end
    
    def infer_sale_name 
      @date = Date.today 
      @sale_for_who = self.client ? self.client.name : self.service.title
      self.name = 'Orçamento para ' + @sale_for_who + ' - ' + @date.to_s  
    end

    def get_total_value
      @total_value = self.comission_value + self.value + (self.service ? self.service.value : 0 ) 
      
      return @total_value
    end 

   
end
