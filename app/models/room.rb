class Room < ApplicationRecord
    #validates_presence_of :title, :location
    #validates :title, presence: true
    # validates :title, :location, :description, presence: true
    validates :title, :location, :description, presence: true
    validates :description, length: { in: 5..20 }

    def complete_name
      "#{title}, #{location}"
    end
end
