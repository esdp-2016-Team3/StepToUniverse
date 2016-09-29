class Question < ApplicationRecord
	has_many :answers
	accepts_nested_attributes_for :answers, allow_destroy: true
	belongs_to :level
	validates :content, :presence => true
end
