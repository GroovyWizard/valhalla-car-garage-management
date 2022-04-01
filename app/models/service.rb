class Service < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_one :sale
    belongs_to :vehicle

    validates :title, presence: true
    validates :value, presence: true
    validates :vehicle_id, presence: true

    scope :from_this_month, lambda { 
        where("services.created_at > ? AND services.created_at < ?", 
        Time.now.beginning_of_month, Time.now.end_of_month) }
    
    def get_tasks_on_time 
        @on_time = self.tasks.where("finish_date <= estimative")
    end

    def self.get_tasks_overdue
        @overdue = self.tasks.where("finish_date > estimative")
    end

    def count_tasks 
        self.tasks.count
    end

    def status_parsed
        if status == true 
            return "Concluida"
        else 
            return "Não concluida"
        end
    end

end
