class TeacherTime < ApplicationRecord
	belongs_to :status_time_teacher
	has_many :lessons, dependent: :destroy
end
