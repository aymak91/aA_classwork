class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :subs,
    class_name: :Sub,
    foreign_key: :moderator_id,
    dependent: :destroy

  has_many :posts,
    foreign_key: :author_id,
    dependent: :destroy
  
  after_initialize :ensure_session_token
  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_password?(password)
      user
    else
      nil
    end
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    pass_obj = BCrypt::Password.new(self.password_digest)
    pass_obj.is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
end
