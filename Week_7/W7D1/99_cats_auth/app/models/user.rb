class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    # validates :password, allow_nil: true
    
    after_initialize :ensure_session_token!

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token!
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def password=(password)
        puts "setter for password called"
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def password
        puts "getter for password called"
        @password
    end
        
    def is_password?(password)
        puts "is_password called"
        BCrypt::Password.new(self.password_digest).is_password(password)
    end

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        if user && user.check_password?(password)
            user
        else
            return nil
        end
    end

    
end