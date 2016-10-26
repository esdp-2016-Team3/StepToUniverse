class HomeworkQuestion < ApplicationRecord
	belongs_to :survey
    has_many :homework_answers, dependent: :destroy
	accepts_nested_attributes_for :homework_answers, allow_destroy: true
end
