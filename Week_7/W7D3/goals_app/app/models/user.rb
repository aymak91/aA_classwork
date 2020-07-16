class User < ApplicationRecord
    validates :username, presence: true
    validates :password_digest, presence: true
    validates :username, uniqueness: true

    # after_initialize :ensure_session_token
    before_validation :ensure_session_token

    has_many :goals,
        foreign_key: :user_id,
        class_name: :Goal


    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    
    # def reset_session_token!
    #     self.session_token = SecureRandom::urlsafe_base64 # new session_token
    #     self.save!                                        # save it to db
    #     self.session_token                                # return it!
    # end

end
