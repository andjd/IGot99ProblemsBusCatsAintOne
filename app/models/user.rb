class User < ActiveRecord::Base

  validates :name, :password_digest, :session_token, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password

  has_many :cats, dependent: :destroy

  has_many :requests,
    class_name: 'CatRentalRequest',
    primary_key: :id,
    foreign_key: :user_id,
    dependent: :destroy

  has_many :requested_cats,
    through: :requests,
    source: :cat



  def self.find_by_credentials(name, password)
    @current_user ||= User.find_by_name(name)
    return nil unless @current_user
    if @current_user.is_password?(password)
      @current_user
    else
      nil
    end

  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.update! session_token: self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

end
