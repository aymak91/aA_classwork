# == Schema Information
#
# Table name: benches
#
#  id          :bigint           not null, primary key
#  description :string
#  seats       :integer          not null
#  lat         :float
#  lng         :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Bench < ApplicationRecord
    has_many :reviews,
        foreign_key: :bench_id,
        class_name: :Review
end
