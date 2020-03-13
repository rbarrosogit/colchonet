class UserSession
  include ActiveModel::Model
  attr_accessor :email, :password
  validates :email, :password, presence: true

  def initialize(session, attributes={})
    @session = session
    @email = attributes[:email]
    @password = attributes[:password]
  end

  def current_user
    User.find(@session[:user_id])
  end

  def user_signed_in?
    @session[:user_id].present?
  end

  def authenticate
    user = User.authenticate(@email, @password)
    if user.present?
      store(user)
    else
      errors.add(:base, :invalid_login)
      false
    end
  end

  def store(user)
    @session[:user_id] = user_id
  end
end