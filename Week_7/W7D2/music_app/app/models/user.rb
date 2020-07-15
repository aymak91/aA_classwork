class User < ApplicationRecord

    after_initialize :ensure_session_token

    def self.generate_session_token # why do I need this?
        # self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64 # new session_token
        self.save!                                        # save it to db
        self.session_token                                # return it!
    end

    def ensure_session_token
        #this sets the session token
        self.session_token || SecureRandom::urlsafe_base64
    end

    def password=(password)
        @password = password # <- why?
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        # ^takes password_digest and returns a BCrypt pw instance
        password_object.is_password?(password)
        # ^checks if the instance returns T/F
    end

    def self.find_by_credentials(email, password)
        user = User.findy_by(username: username)

        if user && user.is_password?(password)
            user
        else
            nil
        end
    end
end
