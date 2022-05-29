class Provider < ApplicationRecord
    has_many :parts, dependent: :destroy

    
end
