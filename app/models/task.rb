class Task < ApplicationRecord
    belongs_to :service

    validates :title, presence: true
    validates :description, presence: true

    def status_parsed
        if status == true 
            return "Concluida"
        else 
            return "Não concluida"
        end
    end 
end
