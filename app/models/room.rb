class Room < ApplicationRecord
    #validates_presence_of :title, :location
    #validates :title, presence: true
    # validates :title, :location, :description, presence: true
    validates :title, :location, presence: true
    validates :description, presence: true, length: {minimum: 15, maximum: 30}
end
