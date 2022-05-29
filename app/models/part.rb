class Part < ApplicationRecord
    has_many :sale_part
    has_many :sales, through: :sale_part 
    belongs_to :provider, optional: true

    validates :name, presence: true
    validates :value, presence: true
    
    after_initialize :set_defaults

    def set_defaults
      self.value ||= 0.0
      self.model ||= "Genérico" 
    end
    
end 