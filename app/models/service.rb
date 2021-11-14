class Service < ApplicationRecord
    has_many :tasks, dependent: :destroy
    belongs_to :vehicle

    validates :title, presence: true
    validates :value, presence: true
    validates :vehicle_id, presence: true
  
    def self.get_done_on_time
        @service = Service.all
        @on_time = @service.where(DateTime.parse('finish_date') < DateTime.parse('estimative'))
    end

  
end
