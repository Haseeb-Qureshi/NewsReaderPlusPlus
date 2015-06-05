class User < ActiveRecord::Base
  def self.find_by_credentials(params)
    user = User.find_by(email: params[:email])
    return user if user && user.is_password?(params[:password])

    return nil
  end

  attr_reader :password
  after_initialize :ensure_session_token

  validates :password_digest, :session_token, :email, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  def password=(password)
    self.password_digest = BCrypt::Password.new(password)
    @password = password
  end

  def is_password?(password)
    BCrypt::Password.create(password_digest).is_password?(password)
  end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64
    save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end
