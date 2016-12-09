class StatusTimeTeacher < ApplicationRecord
	has_many :teacher_time, dependent: :destroy
end
