class Goal < ApplicationRecord
    validates :name, presence: true
    validates :details, presence: true
    
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User
end
