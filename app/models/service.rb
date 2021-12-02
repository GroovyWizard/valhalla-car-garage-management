class Service < ApplicationRecord
    has_many :tasks, dependent: :destroy
    belongs_to :vehicle

    validates :title, presence: true
    validates :value, presence: true
    validates :vehicle_id, presence: true

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
