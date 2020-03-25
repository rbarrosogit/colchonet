class Room < ApplicationRecord
    validates :title, :location, :description, presence: true
    validates :description, length: { minimum: 5 }
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :reviewed_rooms, through: :reviews, source: :room
    scope :most_recent, -> { order('created_at DESC') }
end
