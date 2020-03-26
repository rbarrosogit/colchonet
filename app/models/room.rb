class Room < ApplicationRecord
  extend FriendlyId
  validates :title, :location, :description, :slug, presence: true
  validates :description, length: { minimum: 5 }
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reviewed_rooms, through: :reviews, source: :room
  scope :most_recent, -> { order('created_at DESC') }
  friendly_id :title, use: [:slugged, :history]
  mount_uploader :picture, PictureUploader

  def self.search(query)
    if query.present?
      where(['location ILIKE :query OR title ILIKE :query OR description ILIKE :query', query: "%#{query}%"])
    else
      Room.all
    end
  end
end
