# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment

    # returns courses that the user is enrolled in by going through enrollments
        has_many :enrolled_courses,
        through: :enrollments,
        source: :course

    # not what we wanted, returns courses that a user teaches
    has_many :taught_courses,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :Course
    

    # enrollment: belongs_to for user
    #  user: has_many that references back to enrollment
end
