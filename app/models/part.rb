class Part < ApplicationRecord
    has_many :sale_part
    has_many :sales, through: :sale_part 
    belongs_to :provider

    validates :name, presence: true
    validates :value, presence: true
    
    after_initialize :set_defaults

    def set_defaults
      self.value ||= 0.0
      self.model ||= "Genérico" 
      self.provider ||= Provider.where(name: "Fornecedor Local").first
    end
    
    def has_sale
      if self.sales.count > 0 
        return true 
      end 
      
      return false 
    end 

    def self.parts_by_sale_amount
      Part.all.each do |part| 
        puts part.sales.count, "here"
      end 
    end 
end 