class Survey < ApplicationRecord
	has_many :questions_for_students, dependent: :destroy
	accepts_nested_attributes_for :questions_for_students, reject_if: lambda { |a| a[:title].blank? }, allow_destroy: true
end
