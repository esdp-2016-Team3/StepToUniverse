class HomeworkStatus < ApplicationRecord
  has_many :homework_assignments, dependent: :destroy
end
