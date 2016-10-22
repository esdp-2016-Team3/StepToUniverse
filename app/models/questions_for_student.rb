class QuestionsForStudent < ApplicationRecord
	belongs_to :survey
    has_many :answers_for_students, dependent: :destroy
	accepts_nested_attributes_for :answers_for_students, allow_destroy: true
end
