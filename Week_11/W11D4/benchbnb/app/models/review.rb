# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  rating     :integer          not null
#  body       :string           not null
#  bench_id   :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Review < ApplicationRecord
    belongs_to :bench,
        foreign_key: :bench_id,
        class_name: :Bench 
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User
end
