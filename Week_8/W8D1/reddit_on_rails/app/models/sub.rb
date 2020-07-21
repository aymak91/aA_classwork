class Sub < ApplicationRecord
  validates :title, :description, :moderator_id, presence: true

  has_many :posts_subs
  has_many :posts,
    through: :posts_subs,
    source: :post

  belongs_to :moderator,
    class_name: :User
    
end
