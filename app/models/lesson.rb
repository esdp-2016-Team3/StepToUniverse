class Lesson < ApplicationRecord
	belongs_to :teacher_time
	validates :day_of_week, presence: true
end
