class Post < ApplicationRecord
    validates :title, presence: true
    
    has_one :author,
        foreign_key: :author_id, # optional
        class_name: :User
    
    has_many :posts_subs
    has_many :subs,
        through: :posts_subs,
        source: :sub
end
