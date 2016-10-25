class Homework < ApplicationRecord
  belongs_to :user
  has_many :homework_files, dependent: :destroy
  has_many :homework_assignments

  accepts_nested_attributes_for :homework_files, allow_destroy: true
end
