class User < ApplicationRecord
    validates :email, :full_name, :location, :password, :bio, presence: true
    validates :password, confirmation: true
    validates :bio, length: {minimum: 30}
end
