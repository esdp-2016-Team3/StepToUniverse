class Survey < ApplicationRecord
    belongs_to :homework
	has_many :homework_questions, dependent: :destroy
	accepts_nested_attributes_for :homework_questions, :reject_if => lambda { |a| a[:title].blank? }, allow_destroy: true
end
