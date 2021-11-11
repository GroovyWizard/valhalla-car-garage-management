class Task < ApplicationRecord
    belongs_to :service

    validates :title, presence: true
    validates :description, presence: true
    validates :status, presence: true
    validates :estimative_cannot_be_in_the_past

    def estimative_cannot_be_in_the_past
        if estimative.present? && estimative.past?
          errors.add(:estimative, "Sua estimativa não pode ser em uma data passada!")
        end
    end 
end
