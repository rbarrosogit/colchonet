class User < ApplicationRecord
    #EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
    validates :email, :full_name, :location, :bio, presence: true
    validates :bio, length: { in: 5..20 }, allow_blank: false
    #validate :email_format
    validates :email, uniqueness: true
    has_secure_password

    before_create do |user|
      user.confirmation_token = SecureRandom.urlsafe_base64
    end

    def confirm!
      return if confirmed?

      self.confirmed_at = Time.current
      self.confirmation_token = ''
      save!
    end

    def confirmed?
      confirmed_at.present?
    end
    private

    def email_format
      errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
    end
end
