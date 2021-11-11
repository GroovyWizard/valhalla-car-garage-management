class Service < ApplicationRecord
    has_many :tasks
    belongs_to :vehicle

    validates :title, presence: true
    validates :value, presence: true
    validates :vehicle_id, presence: true
    after_initialize :default_values
    
    def estimative_cannot_be_in_the_past
        if estimative.present? && estimative.past?
          errors.add(:estimative, "Sua estimativa não pode ser em uma data passada!")
        end
    end  

    def self.get_done_on_time
        @service = Service.all
        @on_time = @service.where(DateTime.parse('finish_date') < DateTime.parse('estimative'))
    end

    private
      def default_values
        self.status ||= 0
      end
end
