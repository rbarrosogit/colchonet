class Room < ApplicationRecord
    validates :title, :location, :description, presence: true
    validates :description, length: { minimum: 5 }
end
