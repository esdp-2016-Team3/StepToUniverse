class HomeworkAssignment < ApplicationRecord
  validates :homework_id, presence: true
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :homework
  has_one :homework_result, dependent: :destroy
  belongs_to :homework_status
end
