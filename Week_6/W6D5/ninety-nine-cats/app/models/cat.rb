class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = ["Tabby", "Black", "Ginger", "Orange", "White"]

    validates :color, inclusion: COLORS
    validates :sex, inclusion: ["M", "F"]
    validates :birth_date, :color, :name, :sex, presence: true

    def age
        time_ago_in_words(self.birth_date)
    end

end
